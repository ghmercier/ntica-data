#!/bin/bash

# Set here files to download
FILES=(
    "s3/ghisl1m/diffusion/insee_data.csv"
    "s3/ghisl1m/diffusion/v_departement_2025.csv"
    "s3/ghisl1m/diffusion/Consultation_des_planches_au_1_sur_2000.pdf"
)

echo "Running download_data.sh..."

DEST_DIR="$HOME/work/data"

mkdir -p "$DEST_DIR"

for SOURCE_FILE in "${FILES[@]}";do
    echo -n "Downloading $SOURCE_FILE... "
    mc cp "$SOURCE_FILE" "$DEST_DIR"

    if [ $? -eq 0 ]; then
	echo "ok."
    else
	echo "failed !"
	exit 1
    fi

done
