-- CLAP core schema sketch (PostgreSQL)
-- tenant_id on all rows; enable RLS in application migrations

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE tenants (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  slug TEXT UNIQUE NOT NULL,
  name TEXT NOT NULL,
  region TEXT NOT NULL DEFAULT 'us-east-1',
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  tenant_id UUID NOT NULL REFERENCES tenants(id),
  email TEXT NOT NULL,
  role TEXT NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE (tenant_id, email)
);

CREATE TABLE offers (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  tenant_id UUID NOT NULL REFERENCES tenants(id),
  name TEXT NOT NULL,
  offer_type TEXT NOT NULL, -- attract | convert | retain | partner
  status TEXT NOT NULL DEFAULT 'draft',
  eligibility JSONB NOT NULL DEFAULT '{}',
  stacking_group TEXT,
  starts_at TIMESTAMPTZ,
  ends_at TIMESTAMPTZ,
  budget_grants BIGINT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX offers_tenant_status ON offers (tenant_id, status);

CREATE TABLE offer_creatives (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  tenant_id UUID NOT NULL REFERENCES tenants(id),
  offer_id UUID NOT NULL REFERENCES offers(id),
  channel TEXT NOT NULL,
  payload JSONB NOT NULL,
  is_default BOOLEAN NOT NULL DEFAULT false
);

CREATE TABLE offer_grants (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  tenant_id UUID NOT NULL REFERENCES tenants(id),
  offer_id UUID NOT NULL REFERENCES offers(id),
  customer_id TEXT NOT NULL,
  campaign_id UUID,
  placement TEXT,
  status TEXT NOT NULL DEFAULT 'granted',
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX grants_tenant_cust ON offer_grants (tenant_id, customer_id, created_at DESC);

CREATE TABLE audiences (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  tenant_id UUID NOT NULL REFERENCES tenants(id),
  name TEXT NOT NULL,
  rules JSONB NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE campaigns (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  tenant_id UUID NOT NULL REFERENCES tenants(id),
  name TEXT NOT NULL,
  audience_id UUID REFERENCES audiences(id),
  channel TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'draft',
  schedule_at TIMESTAMPTZ,
  holdout_pct NUMERIC(5,2) NOT NULL DEFAULT 0,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE campaign_offers (
  tenant_id UUID NOT NULL REFERENCES tenants(id),
  campaign_id UUID NOT NULL REFERENCES campaigns(id),
  offer_id UUID NOT NULL REFERENCES offers(id),
  PRIMARY KEY (campaign_id, offer_id)
);

CREATE TABLE consents (
  tenant_id UUID NOT NULL REFERENCES tenants(id),
  customer_id TEXT NOT NULL,
  purpose TEXT NOT NULL,
  allowed BOOLEAN NOT NULL,
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  PRIMARY KEY (tenant_id, customer_id, purpose)
);

CREATE TABLE audit_log (
  id BIGSERIAL PRIMARY KEY,
  tenant_id UUID NOT NULL,
  actor_id UUID,
  action TEXT NOT NULL,
  entity TEXT NOT NULL,
  entity_id TEXT NOT NULL,
  payload JSONB,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
