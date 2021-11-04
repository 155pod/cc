#-------------------------------------------------------------------------------
# ROMTITLE is a uppercase ASCII, max 12 characters text string containing the
#   output ROM title.
# ROMCODE is a uppercase ASCII, max 4 characters text string containing the
#   output ROM code.
#-------------------------------------------------------------------------------
ROMTITLE    :=  155cc
ROMCODE     :=  155C

#-------------------------------------------------------------------------------
# TARGET is the name of the output.
# BUILD is the directory where object files & intermediate files will be
#   placed.
#-------------------------------------------------------------------------------
TARGET      :=  $(notdir $(CURDIR))
BUILD       :=  build

#-------------------------------------------------------------------------------
# LIBBUTANO is the main directory of butano library
#   (https://github.com/GValiente/butano).
#
# Note that LIBBUTANO should be set to the Butano project directory where the
# file `butano.mak` is.
#
# So, if you cloned the Butano git repository to a directory `/my/butano/`,
# then LIBBUTANO should be set to `/my/butano/butano`.
#
# If this project directory is inside the same directory as your Butano clone,
# for example:
#
#     -> my/
#        -> butano/
#        -> 155cc/
#
# You should not need to change the LIBBUTANO directory here.
#-------------------------------------------------------------------------------
LIBBUTANO   :=  ../butano/butano

#-------------------------------------------------------------------------------
# Export absolute butano path:
#-------------------------------------------------------------------------------
ifndef LIBBUTANOABS
	export LIBBUTANOABS	:=	$(realpath $(LIBBUTANO))
endif

#-------------------------------------------------------------------------------
# PYTHON is the path to the python interpreter.
#-------------------------------------------------------------------------------
PYTHON      :=  python

#-------------------------------------------------------------------------------
# SOURCES is a list of directories containing source code.
#-------------------------------------------------------------------------------
SOURCES     :=  src $(LIBBUTANO)/../common/src

#-------------------------------------------------------------------------------
# DATA is a list of directories containing binary data.
# USERFLAGS is a list of additional compiler flags:
#     Pass -flto to enable link-time optimization.
#     Pass -O0 to improve debugging.
# USERLIBDIRS is a list of additional directories containing libraries.
#     Each libraries directory must contains include and lib subdirectories.
# USERLIBS is a list of additional libraries to link with the project.
# USERBUILD is a list of additional directories to remove when cleaning the
#   project.
# EXTTOOL is an optional command executed before processing audio, graphics and
#   code files.
#-------------------------------------------------------------------------------
DATA        :=
USERFLAGS   :=
USERLIBDIRS :=
USERLIBS    :=
USERBUILD   :=
EXTTOOL     :=

#-------------------------------------------------------------------------------
# In addition to the `include/`, `graphics/`, and `audio/` directories, we also
# want to include the common includes provided by the Butano framework.
#
# INCLUDES is a list of directories containing extra header files.
# GRAPHICS is a list of directories containing files to be processed by grit.
# AUDIO is a list of directories containing files to be processed by mmutil.
#-------------------------------------------------------------------------------
INCLUDES    :=  include $(LIBBUTANO)/../common/include
GRAPHICS    :=  graphics $(LIBBUTANO)/../common/graphics
AUDIO       :=  audio $(LIBBUTANO)/../common/audio

#-------------------------------------------------------------------------------
# Include main makefile:
#-------------------------------------------------------------------------------
include $(LIBBUTANOABS)/butano.mak
