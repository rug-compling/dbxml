package Sleepycat::DbXml;

use strict;
use warnings;

our $VERSION = '2.0050016';

our $strict_txn = 1 ;

sub import
{
    my $this = shift ;
    my $opt = shift ;

    $strict_txn = 0 
        if defined $opt && $opt eq 'simple' ;

    require Sleepycat::Db; Sleepycat::Db->import($strict_txn ? () : 'simple');
}

package DbXml;

use 5.006001;
use strict;
use warnings;
use Carp;

require Exporter;
use AutoLoader;


our @ISA = qw(Exporter);

#our %EXPORT_TAGS = ( 'all' => [ qw(
#	
#) ] );
#
#our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );




our @EXPORT = qw();
	 

sub AUTOLOAD {
    # This AUTOLOAD is used to 'autoload' constants from the constant()
    # XS function.

    my $constname;
    our $AUTOLOAD;
    #($constname = $AUTOLOAD) =~ s/.*:://;
    $constname = $AUTOLOAD;
    croak "&DbXml::constant not defined" if $constname eq 'constant';
    my ($error, $val) = DbXml::constant($constname);
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
XSLoader::load('Sleepycat::DbXml', $VERSION);



*XmlContainer::AUTOLOAD = \&DbXml::AUTOLOAD;
*XmlException::AUTOLOAD = \&DbXml::AUTOLOAD;
*XmlIndexSpecification::AUTOLOAD = \&DbXml::AUTOLOAD;
*XmlQueryContext::AUTOLOAD = \&DbXml::AUTOLOAD;
*XmlContainerConfig::AUTOLOAD = \&DbXml::AUTOLOAD;
*XmlValue::AUTOLOAD = \&DbXml::AUTOLOAD;
*XmlIndexLookup::AUTOLOAD = \&DbXml::AUTOLOAD;
*XmlEventType::AUTOLOAD = \&DbXml::AUTOLOAD;

sub DbXml::DBXML_ADOPT_DBENV ; 
sub DbXml::DBXML_ALLOW_EXTERNAL_ACCESS ; 
sub DbXml::DBXML_ALLOW_AUTO_OPEN ; 
sub DbXml::DBXML_ALLOW_VALIDATION ; 
sub DbXml::DBXML_TRANSACTIONAL ; 
sub DbXml::DBXML_REVERSE_ORDER ; 
sub DbXml::DBXML_INDEX_VALUES ; 
sub DbXml::DBXML_CHKSUM ; 
sub DbXml::DBXML_ENCRYPT ; 
sub DbXml::DBXML_GEN_NAME ; 
sub DbXml::DBXML_LAZY_DOCS ; 
sub DbXml::DBXML_DOCUMENT_PROJECTION ; 
sub DbXml::DBXML_WELL_FORMED_ONLY ; 
sub DbXml::DBXML_INDEX_NODES ; 
sub DbXml::DBXML_NO_INDEX_NODES ; 
sub DbXml::LEVEL_NONE ; 
sub DbXml::LEVEL_DEBUG ; 
sub DbXml::LEVEL_INFO ; 
sub DbXml::LEVEL_WARNING ; 
sub DbXml::LEVEL_ERROR ; 
sub DbXml::LEVEL_ALL ; 
sub DbXml::CATEGORY_NONE ; 
sub DbXml::CATEGORY_INDEXER ; 
sub DbXml::CATEGORY_QUERY ; 
sub DbXml::CATEGORY_OPTIMIZER ; 
sub DbXml::CATEGORY_DICTIONARY ; 
sub DbXml::CATEGORY_CONTAINER ; 
sub DbXml::CATEGORY_NODESTORE ; 
sub DbXml::CATEGORY_MANAGER ; 
sub DbXml::CATEGORY_ALL ; 
sub DbXml::DBXML_VERSION_MAJOR ; 
sub DbXml::DBXML_VERSION_MINOR ; 
sub DbXml::DBXML_VERSION_PATCH ; 
sub XmlContainer::WholedocContainer ; 
sub XmlContainer::NodeContainer ; 
sub XmlContainerConfig::On ; 
sub XmlContainerConfig::Off ; 
sub XmlContainerConfig::UseDefault ;
sub XmlException::INTERNAL_ERROR ; 
sub XmlException::CONTAINER_OPEN ; 
sub XmlException::CONTAINER_CLOSED ; 
sub XmlException::NULL_POINTER ; 
sub XmlException::INDEXER_PARSER_ERROR ; 
sub XmlException::DATABASE_ERROR ; 
sub XmlException::QUERY_PARSER_ERROR ; 
sub XmlException::DOM_PARSER_ERROR ; 
sub XmlException::QUERY_EVALUATION_ERROR ; 
sub XmlException::LAZY_EVALUATION ; 
sub XmlException::DOCUMENT_NOT_FOUND ; 
sub XmlException::CONTAINER_EXISTS ; 
sub XmlException::UNKNOWN_INDEX ; 
sub XmlException::INVALID_VALUE ; 
sub XmlException::VERSION_MISMATCH ; 
sub XmlException::CONTAINER_NOT_FOUND ; 
sub XmlException::TRANSACTION_ERROR ; 
sub XmlException::UNIQUE_ERROR ; 
sub XmlException::NO_MEMORY_ERROR ; 
sub XmlException::EVENT_ERROR ; 
sub XmlException::OPERATION_TIMEOUT ; 
sub XmlException::OPERATION_INTERRUPTED ; 
sub XmlIndexSpecification::UNIQUE_OFF ; 
sub XmlIndexSpecification::UNIQUE_ON ; 
sub XmlIndexSpecification::PATH_NONE ; 
sub XmlIndexSpecification::PATH_NODE ; 
sub XmlIndexSpecification::PATH_EDGE ; 
sub XmlIndexSpecification::NODE_NONE ; 
sub XmlIndexSpecification::NODE_ELEMENT ; 
sub XmlIndexSpecification::NODE_ATTRIBUTE ; 
sub XmlIndexSpecification::NODE_METADATA ; 
sub XmlIndexSpecification::KEY_NONE ; 
sub XmlIndexSpecification::KEY_PRESENCE ; 
sub XmlIndexSpecification::KEY_EQUALITY ; 
sub XmlIndexSpecification::KEY_SUBSTRING ; 
sub XmlQueryContext::LiveValues ; 
sub XmlQueryContext::Eager ; 
sub XmlQueryContext::Lazy ; 
sub XmlValue::NONE ; 
sub XmlValue::NODE ; 
sub XmlValue::ANY_SIMPLE_TYPE ; 
sub XmlValue::ANY_URI ; 
sub XmlValue::BASE_64_BINARY ; 
sub XmlValue::BOOLEAN ; 
sub XmlValue::DATE ; 
sub XmlValue::DATE_TIME ; 
sub XmlValue::DAY_TIME_DURATION ; 
sub XmlValue::DECIMAL ; 
sub XmlValue::DOUBLE ; 
sub XmlValue::DURATION ; 
sub XmlValue::FLOAT ; 
sub XmlValue::G_DAY ; 
sub XmlValue::G_MONTH ; 
sub XmlValue::G_MONTH_DAY ; 
sub XmlValue::G_YEAR ; 
sub XmlValue::G_YEAR_MONTH ; 
sub XmlValue::HEX_BINARY ; 
sub XmlValue::NOTATION ; 
sub XmlValue::QNAME ; 
sub XmlValue::STRING ; 
sub XmlValue::TIME ; 
sub XmlValue::YEAR_MONTH_DURATION ; 
sub XmlValue::UNTYPED_ATOMIC ; 
sub XmlValue::BINARY ; 
sub XmlValue::ELEMENT_NODE ; 
sub XmlValue::ATTRIBUTE_NODE ; 
sub XmlValue::TEXT_NODE ; 
sub XmlValue::CDATA_SECTION_NODE ; 
sub XmlValue::ENTITY_REFERENCE_NODE ; 
sub XmlValue::ENTITY_NODE ; 
sub XmlValue::PROCESSING_INSTRUCTION_NODE ; 
sub XmlValue::COMMENT_NODE ; 
sub XmlValue::DOCUMENT_NODE ; 
sub XmlValue::DOCUMENT_TYPE_NODE ; 
sub XmlValue::DOCUMENT_FRAGMENT_NODE ; 
sub XmlValue::NOTATION_NODE ; 
sub XmlIndexLookup::NONE ; 
sub XmlIndexLookup::EQ ; 
sub XmlIndexLookup::GT ; 
sub XmlIndexLookup::GTE ; 
sub XmlIndexLookup::LT ; 
sub XmlIndexLookup::LTE ; 
sub XmlEventType::StartElement ;
sub XmlEventType::EndElement ;
sub XmlEventType::Characters ;
sub XmlEventType::CDATA ;
sub XmlEventType::Comment ;
sub XmlEventType::Whitespace ;
sub XmlEventType::StartDocument ;
sub XmlEventType::EndDocument ;
sub XmlEventType::StartEntityReference ;
sub XmlEventType::EndEntityReference ;
sub XmlEventType::ProcessingInstruction ;
sub XmlEventType::DTD ;


package XmlValue;


our %TypeNameMapping = (
   XmlValue::NONE	=> 'NONE',
   XmlValue::NODE	=> 'NODE',
   XmlValue::ANY_SIMPLE_TYPE	=> 'ANY_SIMPLE_TYPE',
   XmlValue::ANY_URI	=> 'ANY_URI',
   XmlValue::BASE_64_BINARY	=> 'BASE_64_BINARY',
   XmlValue::BOOLEAN	=> 'BOOLEAN',
   XmlValue::DATE	=> 'DATE',
   XmlValue::DATE_TIME	=> 'DATE_TIME',
   XmlValue::DAY_TIME_DURATION	=> 'DAY_TIME_DURATION',
   XmlValue::DECIMAL	=> 'DECIMAL',
   XmlValue::DOUBLE	=> 'DOUBLE',
   XmlValue::DURATION	=> 'DURATION',
   XmlValue::FLOAT	=> 'FLOAT',
   XmlValue::G_DAY	=> 'G_DAY',
   XmlValue::G_MONTH	=> 'G_MONTH',
   XmlValue::G_MONTH_DAY	=> 'G_MONTH_DAY',
   XmlValue::G_YEAR	=> 'G_YEAR',
   XmlValue::G_YEAR_MONTH	=> 'G_YEAR_MONTH',
   XmlValue::HEX_BINARY	=> 'HEX_BINARY',
   XmlValue::NOTATION	=> 'NOTATION',
   XmlValue::QNAME	=> 'QNAME',
   XmlValue::STRING	=> 'STRING',
   XmlValue::TIME	=> 'TIME',
   XmlValue::YEAR_MONTH_DURATION	=> 'YEAR_MONTH_DURATION',
   XmlValue::UNTYPED_ATOMIC	=> 'UNTYPED_ATOMIC',
   XmlValue::BINARY	=> 'BINARY',
);



package DbXml;

{

    my @txnids = (

	    [ 'XmlManager', 'createContainer',	1, 5],
	    [ 'XmlManager', 'openContainer',	1, 3],
	    [ 'XmlManager', 'removeContainer',	1, 2],
	    [ 'XmlManager', 'renameContainer',	2, 3],
	    [ 'XmlManager', 'reindexContainer',	1, 4],
	    [ 'XmlManager', 'prepare',	1, 3],
	    [ 'XmlManager', 'query',	1, 4],

	    [ 'XmlContainer', 'setIndexSpecification',1, 3],
	    [ 'XmlContainer', 'getIndexSpecification',0, 2],
	    [ 'XmlContainer', 'addDefaultIndex',	1, 3],
	    [ 'XmlContainer', 'deleteDefaultIndex',	1, 3],
	    [ 'XmlContainer', 'replaceDefaultIndex',	1, 3],
	    [ 'XmlContainer', 'addIndex',	3, 5],
	    [ 'XmlContainer', 'deleteIndex',	4, 5],
	    [ 'XmlContainer', 'replaceIndex',	4, 5],
	    [ 'XmlContainer', 'getDocument',	1, 3],
	    [ 'XmlContainer', 'updateDocument',	1, 3],
	    [ 'XmlContainer', 'getAllDocuments',	0, 2],
	    [ 'XmlContainer', 'getNumDocuments',	0, 1],

	    [ 'XmlIndexLookup', 'execute',	1, 3],

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
    
                ($Db::_filename, $Db::_line) = (caller)[1,2];
    
                if ($Sleepycat::DbXml::strict_txn
		    || @_ && !defined $_[0] 
		    || ref $_[0] && UNIVERSAL::isa($_[0], "XmlTransaction")) {
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

sub printVersionInfo
{
    my ($major, $minor, $patch) = (0,0,0) ;
    print "perl  : $]\n" ;
    print "dbxml : " . dbxml_version($major, $minor, $patch) . "\n" ;
    print "db    : " . DbEnv::version($major, $minor, $patch) . "\n";
    print "xerces: " . xerces_version() . "\n";

}

package XmlManager ;

use Carp;

package XmlResults ;

use Carp;


package XmlContainer ;

use Carp;

sub deleteDocument
{
    my $THIS = shift ;

    unless ($Sleepycat::DbXml::strict_txn ||
        (! defined $_[0] || ref $_[0] && UNIVERSAL::isa($_[0], "XmlTransaction")))
        {
           unshift @_, undef ;
        
        }

    croak "deleteDocument needs between 2 and 3 parameters\n" 
        if @_ < 2 || @_ > 3;


    if (ref $_[1] && UNIVERSAL::isa($_[1], "XmlDocument")) {
        $THIS->deleteDocument_1(@_) ;
    }
    else {
        $THIS->deleteDocument_2(@_) ;	    
    }	   
}

sub putDocument
{
    my $THIS = shift ;


    unless ($Sleepycat::DbXml::strict_txn ||
        (! defined $_[0] || ref $_[0] && UNIVERSAL::isa($_[0], "XmlTransaction")))
        {
           unshift @_, undef ;
        
        }

    croak "putDocument needs between 1 and 4 parameters\n" 
        if @_ < 1 || @_ > 5;


    local $Carp::CarpLevel = 1 ;
    if (ref $_[1] && UNIVERSAL::isa($_[1], "XmlDocument")) {
        $THIS->_putDocument_1(@_) ;
    }
    else {
        $THIS->_putDocument_2(@_) ;	    
    }	   
}

sub lookupIndex
{
    my $THIS = shift ;

    unless ($Sleepycat::DbXml::strict_txn ||
        (! defined $_[0] || ref $_[0] && UNIVERSAL::isa($_[0], "XmlTransaction")))
        {
           unshift @_, undef ;
        
        }

    croak "lookupIndex needs between 6 and 9 parameters\n" 
        if @_ < 6 || @_ > 9;


    if (@_ <= 7) {
        $THIS->_lookupIndex_1(@_) ;
    }
    else {
        $THIS->_lookupIndex_2(@_) ;	    
    }	   
}

sub lookupStatistics
{
    my $THIS = shift ;

    unless ($Sleepycat::DbXml::strict_txn ||
        (! defined $_[0] || ref $_[0] && UNIVERSAL::isa($_[0], "XmlTransaction")))
        {
           unshift @_, undef ;
        
        }

    croak "lookupStatistics needs between 3 and 7 parameters\n" 
        if @_ < 3 || @_ > 7;


    if (@_ < 6) {
        $THIS->_lookupStatistics_1(@_) ;
    }
    else {
        $THIS->_lookupStatistics_2(@_) ;	    
    }	   
}

package XmlException ;

our @ISA = qw(std::exception);

sub catch
{
    return $@
        if (ref($@) && UNIVERSAL::isa($@, "XmlException"));

    return undef ;
}	

#package std::exception ;
#
#sub catch
#{
#    return $@
#        if (ref($@) && UNIVERSAL::isa($@, "std::exception"));
#
#    return undef ;
#}	

package XmlDocument ;

use Carp;

*AUTOLOAD = \&DbXml::AUTOLOAD;
use UNIVERSAL qw( isa ) ;

use overload '""' => \&_asString,
            'cmp' => \&_cmp,
            ;

sub _asString
{
    my $THIS = shift ;
    return $THIS->getContent() ;
}

sub _cmp
{
    my $THIS = shift ;
    my $THAT = shift ;
    return isa $THIS, 'XmlDocument' ? $THIS->getContent() : $THIS cmp 
           isa $THAT, 'XmlDocument' ? $THAT->getContent() : $THAT ;
}


package XmlQueryExpression;

use Carp;

sub execute
{
    my $THIS = shift ;

    unless ($Sleepycat::DbXml::strict_txn ||
        (! defined $_[0] || ref $_[0] && UNIVERSAL::isa($_[0], "XmlTransaction")))
        {
           unshift @_, undef ;
        
        }

    croak "XmlQueryExpression::execute needs beween 1 and 4 parameters\n" unless @_ >= 1 && @_ <= 4 ;

    if ((@_ == 4 || @_ == 3) &&
        ref $_[2] && UNIVERSAL::isa($_[2], "XmlQueryContext") ) 
    {
        push @_, 0 if @_ == 3 ;    
        $THIS->_execute1(@_) ;	    
    }
    elsif ((@_ == 2 || @_ == 3) &&
           ref $_[1] && UNIVERSAL::isa($_[1], "XmlQueryContext"))
    {
        push @_, 0 if @_ == 2 ;    
        $THIS->_execute2(@_) ;	    
    }	   
    else {
        croak "XmlQueryExpression::execute -- parameters incorrect type\n" 
    }
}

package XmlValue ;

use Carp;
use UNIVERSAL qw( isa ) ;

use overload '""' => \&_asString,
            'cmp' => \&_cmp,
             ;

sub _cmp
{
    my $THIS = shift ;
    my $THAT = shift ;
    return isa $THIS, 'XmlValue' ? $THIS->asString() : $THIS cmp 
           isa $THAT, 'XmlValue' ? $THAT->asString() : $THAT ;
}

sub _asString
{
    my $THIS = shift ;
    return $THIS->asString() ;
}

sub _getTypeName
{
    my $THIS = shift ;
    my $type = $THIS->getType(@_);
    #return $TypeNameMapping{$type} || 'Unknown';
    return defined $TypeNameMapping{$type} 
                  ?  $TypeNameMapping{$type} 
                  :  'Unknown' ;
}

sub dump
{
    my $THIS = shift ;
    my $type = $THIS->getType(@_);
    my $name = $THIS->_getTypeName();
    print "Type is $name ($type)" ;

    if ($type == XmlValue::BOOLEAN  || 
	$type == XmlValue::DECIMAL   || 
	$type == XmlValue::STRING   || 
	$type == XmlValue::NODE     || 
	$type == XmlValue::DOUBLE  )
        { print ", value is '". $THIS->asString . "'\n" }
    else
        { print "\n" }
	
}

package DbtPtr;

use Carp;
our @ISA = qw(Dbt);

sub DESTROY
{
    my $class = shift ;

}


package DbXml ;

1;
__END__
