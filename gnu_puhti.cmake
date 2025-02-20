
set(MPICC "mpicc")

set(MPICXX "mpicxx")

set(MPIFC "mpif90")

set(SCC "gcc")
set(SCXX "g++")
set(SFC "gfortran")

set(MPI_LIB_NAME "pmi2")

set(NETCDF_C_PATH $ENV{NETCDF_C_INSTALL_ROOT})

set(NETCDF_FORTRAN_PATH $ENV{NETCDF_FORTRAN_INSTALL_ROOT})

set(PNETCDF_PATH $ENV{PARALLEL_NETCDF_INSTALL_ROOT})

set(ESMF_LIBDR "/fmi/projappl/project_2006422/esmf_gfortran_v8.8.0/lib/libO/Linux.gfortran.64.mpiuni.default")

set(PIO_FILESYSTEM_HINTS "lustre")

set(FFLAGS_NOOPT "-O0")


if (MPILIB STREQUAL pmi2)
	string(APPEND SLIBS "-lnetcdff -lnetcdf -lpmi -L$ENV{MKLROOT} -lmkl_rt")
endif()

string(APPEND FFLAGS " -fconvert=big-endian -ffree-line-length-none -ffixed-line-length-none")
if (compile_threaded)
  string(APPEND FFLAGS " -fopenmp")
endif()
if (DEBUG)
  string(APPEND FFLAGS " -g -Wall -Og -fbacktrace -ffpe-trap=zero,overflow -fcheck=bounds")
endif()
if (NOT DEBUG)
  string(APPEND FFLAGS " -O")
endif()

message("C compiler version is ${CMAKE_C_COMPILER_VERSION}")
message("Fortran compiler version is ${CMAKE_Fortran_COMPILER_VERSION}")
if (CMAKE_Fortran_COMPILER_VERSION VERSION_GREATER_EQUAL 10)
  string(APPEND FFLAGS " -fallow-argument-mismatch  -fallow-invalid-boz ")
endif()


