$PYTHON -m pip install . --no-deps -vv

if [ -d "$PREFIX/condabin" ]; then
	echo "Adding link to mamba into condabin";
	ln -s $PREFIX/bin/mamba $PREFIX/condabin/mamba
fi