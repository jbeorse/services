
LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_CFLAGS += -DHAVE_USLEEP=1
LOCAL_CFLAGS += -DHAVE_ISNAN
LOCAL_CFLAGS += -DSQLITE_DEFAULT_JOURNAL_SIZE_LIMIT=1048576
LOCAL_CFLAGS += -DSQLITE_THREADSAFE=2
LOCAL_CFLAGS += -DSQLITE_TEMP_STORE=3
LOCAL_CFLAGS += -DSQLITE_POWERSAFE_OVERWRITE=1
LOCAL_CFLAGS += -DSQLITE_DEFAULT_FILE_FORMAT=4
LOCAL_CFLAGS += -DSQLITE_ENABLE_MEMORY_MANAGEMENT=1
LOCAL_CFLAGS += -DSQLITE_ENABLE_FTS3
LOCAL_CFLAGS += -DSQLITE_ENABLE_FTS3_BACKWARDS
LOCAL_CFLAGS += -DSQLITE_ENABLE_FTS4
LOCAL_CFLAGS += -DSQLITE_OMIT_BUILTIN_TEST
LOCAL_CFLAGS += -DSQLITE_OMIT_LOAD_EXTENSION
LOCAL_CFLAGS += -DSQLITE_DEFAULT_FILE_PERMISSIONS=0600
# fdatasync is not available on armeabi-v7a
# LOCAL_CFLAGS += -Dfdatasync=fdatasync
LOCAL_CFLAGS += -DHAVE_MALLOC_USABLE_SIZE
LOCAL_CFLAGS += -DSQLITE_OMIT_BUILTIN_TEST
LOCAL_CFLAGS += -USQLITE_HAS_CODEC
LOCAL_CFLAGS += -DSQLITE_OMIT_DEPRECATED
LOCAL_CFLAGS += -pthread
LOCAL_CFLAGS += -DSQLITE_DEFAULT_LOCKING_MODE=0
LOCAL_CFLAGS += -DNDEBUG

LOCAL_CPPFLAGS += $(LOCAL_CFLAGS)
 LOCAL_CPPFLAGS += -Dnullptr=0
#LOCAL_CPPFLAGS += -std=c++11
# LOCAL_CPPFLAGS += -std=gnu++11

LOCAL_SRC_FILES:=                             \
	org_sqlite_database_sqlite_SQLiteCommon.cpp     \
	org_sqlite_database_sqlite_SQLiteConnection.cpp

LOCAL_SRC_FILES += sqlite3.c

LOCAL_C_INCLUDES += $(LOCAL_PATH) 

LOCAL_CFLAGS += -I.
LOCAL_CPPFLAGS += -I.

LOCAL_MODULE:= libsqliteX
LOCAL_LDLIBS += -ldl -llog 

include $(BUILD_SHARED_LIBRARY)

