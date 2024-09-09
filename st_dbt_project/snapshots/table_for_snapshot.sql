{% snapshot table_for_snapshot %}

{% set new_schema = target.schema + '_snapshot' %}

{{
    config(
        target_database = 'kering-onboarding',
        target_schema = new_schema,
        unique_key = 'order_id',
        strategy = 'timestamp',
        updated_at = 'updated_at'
    )
}}

select * from kering-onboarding.{{target.schema}}.table_for_snapshot

{% endsnapshot %}