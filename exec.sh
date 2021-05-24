# First build the container
docker build . -t airbyte/covid-python:dev

# Then use the following commands to run it
docker run --rm airbyte/covid-python:dev spec
docker run --rm -v $(pwd)/secrets:/secrets airbyte/covid-python:dev check --config /secrets/config.json
docker run --rm -v $(pwd)/secrets:/secrets airbyte/covid-python:dev discover --config /secrets/config.json
docker run --rm -v $(pwd)/secrets:/secrets -v $(pwd)/sample_files:/sample_files airbyte/covid-python:dev read --config /secrets/config.json --catalog /sample_files/configured_catalog.json