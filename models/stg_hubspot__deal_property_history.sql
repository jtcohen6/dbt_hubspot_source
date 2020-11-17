{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_sales_enabled','hubspot_deal_enabled'])) }}

with base as (

    select *
    from {{ ref('stg_hubspot__deal_property_history_tmp') }}

), macro as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_hubspot__deal_property_history_tmp')),
                staging_columns=get_deal_property_history_columns()
            )
        }}
    from base

), fields as (

    select
        _fivetran_synced,
        deal_id,
        name as field_name,
        source as change_source,
        source_id as change_source_id,
        timestamp as change_timestamp,
        value as new_value
    from macro
    
)

select *
from fields


