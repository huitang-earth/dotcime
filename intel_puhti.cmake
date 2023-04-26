
set(MPICC "mpiicc")

set(MPICXX "mpiicpc")

set(MPIFC "mpiifort")

set(SCC "icc")
set(SCXX "icpc")
set(SFC "ifort")

set(MPI_LIB_NAME "pmi2")

set(NETCDF_C_PATH $ENV{NETCDF_C_INSTALL_ROOT})

set(NETCDF_FORTRAN_PATH $ENV{NETCDF_FORTRAN_INSTALL_ROOT})

set(PNETCDF_PATH $ENV{PARALLEL_NETCDF_INSTALL_ROOT})

set(ESMF_LIBDR "/fmi/projappl/project_2006422/esmf_ifort_v8.4.1")

set(PIO_FILESYSTEM_HINTS "lustre")

if (MPILIB STREQUAL pmi2)
	string(APPEND SLIBS " -mkl=cluster  -lnetcdff -lnetcdf -lpmi -L$ENV{MKLROOT} -lmkl_rt")
endif()


string(APPEND FFLAGS " -O2 -xCORE-AVX2 -warn nointerfaces ")
