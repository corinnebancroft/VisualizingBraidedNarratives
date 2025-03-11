#!/bin/bash

echo "Getting latest overnight db dumps to store in the repo..."
scp -q -o LogLevel=quiet mholmes@nfs.hcmc.uvic.ca:/home1t/mholmes/www/public/narratives_dbs/narratives_de_latest.* export_scripts/data/de/dump/
scp -q -o LogLevel=quiet mholmes@nfs.hcmc.uvic.ca:/home1t/mholmes/www/public/narratives_dbs/narratives_gs_latest.* export_scripts/data/gs/dump/
scp -q -o LogLevel=quiet mholmes@nfs.hcmc.uvic.ca:/home1t/mholmes/www/public/narratives_dbs/narratives_hp_latest.* export_scripts/data/hp/dump/
scp -q -o LogLevel=quiet mholmes@nfs.hcmc.uvic.ca:/home1t/mholmes/www/public/narratives_dbs/narratives_original_latest.* export_scripts/data/original/dump/
scp -q -o LogLevel=quiet mholmes@nfs.hcmc.uvic.ca:/home1t/mholmes/www/public/narratives_dbs/narratives_pnp_latest.* export_scripts/data/pnp/dump/
scp -q -o LogLevel=quiet mholmes@nfs.hcmc.uvic.ca:/home1t/mholmes/www/public/narratives_dbs/narratives_pod_latest.* export_scripts/data/pod/dump/
scp -q -o LogLevel=quiet mholmes@nfs.hcmc.uvic.ca:/home1t/mholmes/www/public/narratives_dbs/narratives_tkam_latest.* export_scripts/data/tkam/dump/
scp -q -o LogLevel=quiet mholmes@nfs.hcmc.uvic.ca:/home1t/mholmes/www/public/narratives_dbs/narratives_to_latest.* export_scripts/data/to/dump/
scp -q -o LogLevel=quiet mholmes@nfs.hcmc.uvic.ca:/home1t/mholmes/www/public/narratives_dbs/narratives_tt_latest.* export_scripts/data/tt/dump/
echo "DONE! Now you can commit any changes."
