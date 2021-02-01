allSrcDir:=lib lib/vauth lib/vquic lib/vssh lib/vtls
allIncDir:=include

allDefines:=BUILDING_LIBCURL HAVE_STRUCT_TIMEVAL HAVE_ERRNO_H HAVE_UNISTD_H HAVE_SOCKET HAVE_LONGLONG HAVE_SYS_STAT_H HAVE_SELECT HAVE_SYS_TYPES_H HAVE_FCNTL_H SIZEOF_SHORT=2
allDefines+=USE_BLOCKING_SOCKETS
allDefines+=CURL_DISABLE_LDAP
allDefines+=OS=\"Linux\"

ifeq ($(DEST_PLATFORM),MinGW) #Linux下的交叉编译器
sysLibs:=ws2_32
else ifeq ($(DEST_PLATFORM),Windows) #Windows下的MinGW
sysLibs:=ws2_32
else #默认Linux环境
allDefines+=HAVE_NETINET_IN_H HAVE_NETDB_H HAVE_ARPA_INET_H HAVE_SYS_SELECT_H
allDefines+=HAVE_RECV RECV_TYPE_ARG1=int RECV_TYPE_ARG2=void* RECV_TYPE_ARG3=size_t RECV_TYPE_ARG4=int RECV_TYPE_RETV=size_t
allDefines+=HAVE_SEND SEND_TYPE_ARG1=int SEND_QUAL_ARG2=const SEND_TYPE_ARG2=void* SEND_TYPE_ARG3=size_t SEND_TYPE_ARG4=int SEND_TYPE_RETV=ssize_t
allDefines+=SIZEOF_INT=2 SIZEOF_LONG=2 SIZEOF_CURL_OFF_T=2 SIZEOF_SIZE_T=SIZEOF_CURL_OFF_T
endif

libName:=curl
include ../CompileScripts/Makefile