import dlt
import dagster as dg
from dagster_dlt import DagsterDltResource, dlt_assets
from dagster_dbt import DbtCliResource, dbt_assets, DbtProject
from pathlib import Path

# to import dlt script
import sys 
sys.path.insert(0, '../data_extract_load')
from load_job_ads import jobads_resourse


# data warehouse directory
db_path = str(Path(__file__).parents[1] / "data_warehouse/job_ads.duckdb")

#dlt assets
dlt_resource = DagsterDltResource()

