 ls *.ipynb | entr -s "jupyter nbconvert *.ipynb --to slides --output-dir ./html"
