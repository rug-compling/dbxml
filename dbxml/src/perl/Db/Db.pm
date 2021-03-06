package Sleepycat::Db;

use 5.006001;
use strict;
use warnings;

our $VERSION = '4.008026';

our $strict_txn = 1 ;

sub import
{
    my $this = shift ;
    my $opt = shift ;

    $strict_txn = 0 
        if defined $opt && $opt eq 'simple' ;

}

package Db;

use strict;
use warnings;
use Carp;

require Exporter;

our $VERSION = $Sleepycat::Db::VERSION;

our @ISA = qw(Exporter);

our @EXPORT = qw();
	 

sub AUTOLOAD {
    # This AUTOLOAD is used to 'autoload' constants from the constant()
    # XS function.

    my $constname;
    our $AUTOLOAD;
    #($constname = $AUTOLOAD) =~ s/.*:://;
    $constname = $AUTOLOAD;
    croak "&Db::constant not defined" if $constname eq 'constant';
    my ($error, $val) = Db::constant($constname);
    if ($error) { croak $error; }
    {
	no strict 'refs';
	# Fixed between 5.005_53 and 5.005_61
#XXX	if ($] >= 5.00561) {
#XXX	    *$AUTOLOAD = sub () { $val };
#XXX	}
#XXX	else {
	    *$AUTOLOAD = sub { $val };
#XXX	}
    }
    goto &$AUTOLOAD;
}

require XSLoader;
XSLoader::load('Sleepycat::Db', $VERSION);

our ($_filename, $_line);

{

    my @txnids = (
	    [ 'Db', 'open', 		3, 6],
	    [ 'Db', 'put', 		2, 4],
	    [ 'Db', 'get', 		2, 4],
	    [ 'Db', 'pget', 		3, 5],
	    [ 'Db', 'del', 		1, 3],
	    [ 'Db', 'cursor', 		0, 3],
	    );
	
    foreach (@txnids)
    {
	my ($pkg, $name, $from, $to) = @{ $_ } ;

        my $sub = <<'EOM' ;
            sub PACKAGE::NAME
            {
                my $THIS = shift ;
    
                croak "PACKAGE::NAME needs between FROM and TO parameters\n" 
                    if @_ < FROM || @_ > TO;
    
                ($_filename, $_line) = (caller)[1,2];

                if ($Sleepycat::Db::strict_txn ||
		    @_ && !defined $_[0] || 
		    ref $_[0] && UNIVERSAL::isa($_[0], "DbTxn")) {
                    $THIS->_NAME(@_) ;	    
                }
                else {
                    $THIS->_NAME(undef, @_) ;	    
                }	   
            }
EOM

        $sub =~ s/PACKAGE/$pkg/g ;
        $sub =~ s/NAME/$name/g ;
        $sub =~ s/FROM/$from/g ;
        $sub =~ s/TO/$to/g ;
        eval $sub;
    }

}

while (<Sleepycat::Db::DATA>)
{
    chomp;
    s/^\s*//;
    s/\s$//;
    s/\s+(\d+\S+)\s*$//;
    s/\s+(STRING|DEFINE)\s*//;
    next if /^\s*$/ || /^\s*#/;
    eval " sub $_ ; " ;
    die "xxx $@\n"  if $@;
}

sub new
{
    my $CLASS = shift ;
    unshift @_, undef 
        unless @_ >= 2 || ! defined $_[0] || 
	       ref $_[0] && UNIVERSAL::isa($_[0], "DbEnv");
    Db_::new($CLASS, @_);

	
}

package std::exception ;

sub catch
{
    return $@
        if (ref($@) && UNIVERSAL::isa($@, "std::exception"));

    return undef ;
}	

package UnknownException;

our @ISA = qw(std::exception);

sub catch
{
    return $@
        if (ref($@) && UNIVERSAL::isa($@, "UnknownException"));

    return undef ;
}	

package DbException ;

our @ISA = qw(std::exception);

sub type
{
    my $this = shift ;
    return ref $this ;
}

sub catch
{
    return $@
        if (ref($@) && UNIVERSAL::isa($@, "DbException"));

    return undef ;
}	

package DbDeadlockException ;

our @ISA = qw(DbException);

sub catch
{
    return $@
        if (ref($@) && UNIVERSAL::isa($@, "DbDeadlockException"));

    return undef ;
}	

package DbRunRecoveryException ;

our @ISA = qw(DbException);

sub catch
{
    return $@
        if (ref($@) && UNIVERSAL::isa($@, "DbRunRecoveryException"));

    return undef ;
}	

package Dbt;

use Carp;

sub new
{
    my $class = shift ;

    return Dbt0::new($class) if @_ == 0 ;
    return Dbt2::new($class, @_) if @_ == 1 || @_ == 2 ;

    croak "Dbt expects 0, 1 or 2 parameters" ;
}


package Sleepycat::Db;

1;

__DATA__

	DB_AFTER
	DB_AGGRESSIVE

	DB_APPEND
	DB_ARCH_ABS
	DB_ARCH_DATA
	DB_ARCH_LOG
	DB_AUTO_COMMIT
	DB_BEFORE
#	DB_CACHED_COUNTS
	DB_CDB_ALLDB
	DB_CHKSUM		DEFINE
	DB_CHKSUM_SHA1		DEFINE
	DB_CONSUME
	DB_CONSUME_WAIT
	DB_CREATE
	DB_CURRENT
	DB_CXX_NO_EXCEPTIONS

	DB_DBT_PARTIAL

	DB_DIRECT
	DB_DIRECT_DB
	DB_DIRTY_READ
	DB_DONOTINDEX
	DB_DUP
	DB_DUPSORT
	DB_EID_BROADCAST
	DB_EID_INVALID
	DB_ENCRYPT
	DB_ENCRYPT_AES
	DB_EXCL
	DB_FAST_STAT
	DB_FILE_ID_LEN
	DB_FIRST
	DB_FLUSH
	DB_FORCE
	DB_GET_BOTH
	DB_GET_BOTH_RANGE
	DB_GET_RECNO
	DB_INIT_CDB
	DB_INIT_LOCK
	DB_INIT_LOG
	DB_INIT_MPOOL
	DB_INIT_TXN
	DB_JOINENV
	DB_JOIN_ITEM
	DB_JOIN_NOSORT
	DB_KEYEMPTY
	DB_KEYEXIST
	DB_KEYFIRST
	DB_KEYLAST
	DB_LAST
	DB_LOCKDOWN
	DB_LOCK_DEADLOCK
	DB_LOCK_DEFAULT
	DB_LOCK_EXPIRE
	DB_LOCK_MAXLOCKS
	DB_LOCK_MINLOCKS
	DB_LOCK_MINWRITE
	DB_LOCK_NOTGRANTED
	DB_LOCK_NOWAIT
	DB_LOCK_OLDEST
	DB_LOCK_RANDOM
	DB_LOCK_YOUNGEST
#	DB_LOGC_BUF_SIZE
#	DB_MPOOL_CLEAN
	DB_MPOOL_CREATE
	DB_MPOOL_DIRTY
	DB_MPOOL_LAST
	DB_MPOOL_NEW
	DB_MULTIPLE
	DB_MULTIPLE_KEY
	DB_NEXT
	DB_NEXT_DUP
	DB_NEXT_NODUP
	DB_NODUPDATA
	DB_NOLOCKING
	DB_NOMMAP
	DB_NOORDERCHK
	DB_NOOVERWRITE
	DB_NOPANIC
	DB_NOSERVER
	DB_NOSERVER_HOME
	DB_NOSERVER_ID
	DB_NOSYNC
	DB_NOTFOUND
	DB_ODDFILESIZE
	DB_OLD_VERSION
	DB_ORDERCHKONLY
	DB_OVERWRITE
	DB_PAGE_NOTFOUND
	DB_PANIC_ENVIRONMENT
	DB_POSITION
	DB_PREV
	DB_PREV_NODUP
	DB_PRINTABLE
	DB_PRIVATE
	DB_RDONLY
	DB_RECNUM
#	DB_RECORDCOUNT
	DB_RECOVER
	DB_RECOVER_FATAL
	DB_REGION_INIT
	DB_RENUMBER
	DB_REP_CLIENT
	DB_REP_DUPMASTER
	DB_REP_HOLDELECTION
    #DB_REP_LOGSONLY
	DB_REP_MASTER
	DB_REP_NEWMASTER
	DB_REP_NEWSITE
    #DB_REP_OUTDATED
	DB_REP_PERMANENT
	DB_REP_UNAVAIL
	DB_REVSPLITOFF
	DB_RMW
    #DB_RPC_SERVERPROG
    #DB_RPC_SERVERVERS
	DB_RUNRECOVERY
	DB_SALVAGE
	DB_SECONDARY_BAD
	DB_SET
	DB_SET_LOCK_TIMEOUT
	DB_SET_RANGE
	DB_SET_RECNO
	DB_SET_TXN_TIMEOUT
	DB_SNAPSHOT
	DB_STAT_CLEAR
	DB_SYSTEM_MEM
	DB_THREAD
	DB_TRUNCATE
	DB_TXN_NOSYNC
	DB_TXN_NOWAIT
	DB_TXN_SYNC
	DB_TXN_WRITE_NOSYNC
	DB_UPGRADE
	DB_USE_ENVIRON
	DB_USE_ENVIRON_ROOT
    #DB_VERB_CHKPOINT
	DB_VERB_DEADLOCK
	DB_VERB_RECOVERY
	DB_VERB_REPLICATION
	DB_VERB_WAITSFOR
	DB_VERIFY
	DB_VERIFY_BAD
	DB_VERSION_MAJOR
	DB_VERSION_MINOR
	DB_VERSION_PATCH
	DB_VERSION_STRING          STRING
	DB_WRITECURSOR
	#DB_XA_CREATE removed in 4.8
	#DB_XIDDATASIZE removed in 4.8
	DB_YIELDCPU
	TXN_NOSYNC
	TXN_NOWAIT
	TXN_SYNC

        # new in 4.4
        DB_FREELIST_ONLY           DEFINE
        DB_FREE_SPACE              DEFINE
        DB_IMMUTABLE_KEY           DEFINE
        DB_MUTEX_SELF_BLOCK        DEFINE
        DB_READ_COMMITTED          DEFINE
        DB_READ_UNCOMMITTED        DEFINE
        DB_REGISTER                DEFINE
        DB_REP_ANYWHERE            DEFINE
        DB_REP_IGNORE              DEFINE
        DB_REP_LOCKOUT             DEFINE
        DB_REP_REREQUEST           DEFINE
        DB_VERB_REGISTER           DEFINE
        REP_CONF_NOAUTOINIT        DEFINE
        REP_CONF_BULK              DEFINE
        REP_CONF_DELAYCLIENT       DEFINE
        REP_CONF_NOWAIT            DEFINE
        TXN_WRITE_NOSYNC           DEFINE
    

	# enum db_lockmode_t
	DB_LOCK_NG
	DB_LOCK_READ
	DB_LOCK_WRITE
	DB_LOCK_WAIT
	DB_LOCK_IWRITE
	DB_LOCK_IREAD
	DB_LOCK_IWR
    #DB_LOCK_DIRTY   
	DB_LOCK_WWRITE
    DB_LOCK_READ_UNCOMITTED 4.4.9

	# enum db_lockop_t
	DB_LOCK_DUMP
	DB_LOCK_GET
	DB_LOCK_GET_TIMEOUT
	DB_LOCK_INHERIT
	DB_LOCK_PUT
	DB_LOCK_PUT_ALL
	DB_LOCK_PUT_OBJ
	DB_LOCK_PUT_READ
	DB_LOCK_TIMEOUT
	DB_LOCK_TRADE
	DB_LOCK_UPGRADE_WRITE

	# enum DB_CACHE_PRIORITY
	DB_PRIORITY_VERY_LOW
	DB_PRIORITY_LOW
	DB_PRIORITY_DEFAULT
	DB_PRIORITY_HIGH
	DB_PRIORITY_VERY_HIGH

	# enum db_recops
	DB_TXN_ABORT
	DB_TXN_APPLY
	DB_TXN_BACKWARD_ROLL
	DB_TXN_FORWARD_ROLL
    #DB_TXN_GETPGNOS
	DB_TXN_PRINT

	# enum DBTYPE
	DB_BTREE
	DB_HASH
	DB_RECNO
	DB_QUEUE
	DB_UNKNOWN
