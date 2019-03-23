#!/bin/bash
sed "s/\(\$textes\[[0-9]*\]\[\"txt\"] = .\{530\}[^ ]*\).*/\1…\";/" frlong.php > fr.php
