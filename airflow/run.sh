
export AIRFLOW_HOME=~/airflow
export AIRFLOW__CORE__LOAD_EXAMPLES=False
echo "All Exported"

airflow db init

fuser -k -n tcp 8080

airflow webserver --port 8080
