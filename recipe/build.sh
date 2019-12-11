if [[ "$OSTYPE" == "darwin"* ]]; then
	export CXXFLAGS=$CXXFLAGS -fno-aligned-allocation -std=c++14
fi

$PYTHON -m pip install . --no-deps -vv

if [ -d "$PREFIX/condabin" ]; then
	echo "Adding link to mamba into condabin";
	ln -s $PREFIX/bin/mamba $PREFIX/condabin/mamba
fi