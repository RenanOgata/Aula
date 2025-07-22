with

source_employees as (

    select * from {{ source('erp', 'employees') }}

)

, renamed as (

    select
        cast(id as int) as employee_pk
        , cast(reportsto as int) as manager_fk    
        , firstname || ' ' || lastname as employee_name    
        , cast(title as varchar) as employee_title        
        , cast(birthdate as date) as employee_birth_date
        , cast(hiredate as date) as employee_hire_date        
        , cast(city as varchar) as employee_city
        , cast(region as varchar) as employee_region    
        , cast(country as varchar) as employee_country
        --, cast(postalcode as varchar) as employee_
        --, cast(ADDRESS as varchar) as employee_
        --, cast(TITLEOFCOURTESY as varchar) as employee_
        --, cast(HOMEPHONE as varchar) as employee_
        --, cast(EXTENSION as varchar) as employee_
        --, cast(PHOTO as varchar) as employee_
        --, cast(NOTES as varchar) as employee_
        --, cast(PHOTOPATH as varchar) as employee_
    from source_employees
)

select *
from renamed
