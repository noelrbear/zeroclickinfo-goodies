package DDG::Goodie::Jira;
# ABSTRACT returns the URL of an Apache or Codehaus JIRA bug ticket according to its identifier

use DDG::Goodie;

zci is_cached => 1;
zci answer_type => 'jira';

primary_example_queries 'ACE-230';
secondary_example_queries '[blah blah] ACE-230 [blah]';
description 'Track Apache and Codehaus JIRA bug tickets';
name 'Jira';
code_url 'https://github.com/duckduckgo/zeroclickinfo-goodies/blob/master/lib/DDG/Goodie/Jira.pm';
category 'programming';
topics 'programming';
attribution github => [ 'https://github.com/arroway', 'arroway'],
            twitter => ['http://twitter.com/steph_ouillon', 'steph_ouillon'];

# Referencing Apache JIRA project keys.
# reference: https://issues.apache.org/jira/secure/BrowseProjects.jspa#all
# A ticket identifier is formed by the key of the project and a number: KEY-NUMBER.
my $Apache_JIRA_keys = qr/ACE|AMQ|AMQNET|APLO|AMQCPP|BLAZE|STOMP|EASYANT|IVY|IVYDE|ANY23|ATTIC|COMDEV|INFRA|LEGAL|PRC|ARIES|AVRO|AXIS|AXISCPP|AXIS2|TRANSPORTS|AXIS2C|KAND|RAMPART|RAMPARTC|SAND|SANDESHA2|SANDESHA2C|SAVAN|BIGTOP|BUILDR|BVAL|STDCXX|CAMEL|CASSANDRA|CAY|CMIS|CHUKWA|CLK|CLKE|CLOUDSTACK|COCOON|COCOON3|COMMONSSITE|ATTRIBUTES|BCEL|BEANUTILS|BETWIXT|BSF|CHAIN|CLI|CODEC|COLLECTIONS|COMPRESS|CONFIGURATION|CSV|DAEMON|DBCP|DBUTILS|DIGESTER|DISCOVERY|DORMANT|EL|EMAIL|EXEC|FILEUPLOAD|FUNCTOR|IMAGING|IO|JCI|JCS|JELLY|JEXL|JXPATH|LANG|LAUNCHER|LOGGING|MATH|MODELER|NET|OGNL|POOL|PRIMITIVES|PROXY|RESOURCES|SANDBOX|SANSELAN|SCXML|TRANSACTION|VALIDATOR|VFS|CB|COUCHDB|RAT|WHISKER|CRUNCH|CXF|DOSGI|FEDIZ|DDLUTILS|DERBY|JDO|TORQUE|TORQUEOLD|DIR|DIRSERVER|DIRAPI|DIRGROOVY|DIRKRB|DIRNAMING|DIRSHARED|DIRSTUDIO|DIRTSEC|ESME|ETCH|FELIX|FLUME|FOR|DAYTRADER|GBUILD|GERONIMO|GERONIMODEVTOOLS|GSHELL|XBEAN|YOKO|GIRAPH|GORA|GUMP|HADOOP|HDFS|MAPREDUCE|YARN|HBASE|HIVE|PIG|HAMA|MODPYTHON|HTTPASYNC|HTTPCLIENT|HTTPCORE|AMBARI|AMBER|AWF|BLUR|DIRECTMEMORY|DRILL|HELIX|S4|CELIX|CLEREZZA|CTAKES|DELTASPIKE|DMAP|DROIDS|EMPIREDB|FALCON|HCATALOG|INCUBATOR|JCLOUDS|JSPWIKI|KALUMET|KITTY|LUCENENET|MARMOTTA|MESOS|MRQL|NPANDAY|NUVEM|ODFTOOLKIT|PODLINGNAMESEARCH|SIS|STANBOL|TASHI|VCL|WOOKIE|ZETACOMP|ISIS|JCR|JCRBENCH|JCRCL|JCRSERVLET|JCRTCK|JCRRMI|OAK|OCM|JCRSITE|IMAP|JSIEVE|JSPF|MAILET|MIME4J|MPT|POSTAGE|PROTOCOLS|JAMES|JENA|JUDDI|SCOUT|KAFKA|KARAF|LABS|HTTPDRAFT|LIBCLOUD|LOGCXX|LOG4J2|LOG4NET|LOG4PHP|LUCENE|LUCY|MAHOUT|ORP|PYLUCENE|SOLR|CONNECTORS|MPOM|ASYNCWEB|FTPSERVER|DIRMINA|SSHD|VYSPER|MRUNIT|ADFFACES|EXTCDI|MFCOMMONS|MYFACES|EXTSCRIPT|EXTVAL|MFHTML5|ORCHESTRA|PORTLETBRIDGE|MYFACESTEST|TOBAGO|TOMAHAWK|TRINIDAD|NUTCH|ODE|OFBIZ|OODT|OOZIE|OPENEJB|OEP|TOMEE|OPENJPA|OPENMEETINGS|OPENNLP|OWB|PDFBOX|PIVOT|JS1|JS2|PLUTO|PORTALS|APA|PB|QPID|PROTON|AGILA|ADDR|ALOIS|ARMI|AVALON|AVNSHARP|RUNTIME|STUDIO|CENTRAL|PLANET|TOOLS|WSIF|BEEHIVE|BLUESKY|CACTUS|FEEDPARSER|DEPOT|ECS|EWS|EXLBR|FORTRESS|GRFT|HARMONY|HERALDRY|HISE|HIVEMIND|IBATISNET|IBATIS|RBATIS|IMPERIUS|JAXME|JSEC|KATO|KI|LOKAHI|LCN4C|MIRAE|MUSE|OJB|OLIO|PNIX|PHOTARK|HERMES|SMX4KNL|SHALE|SOAP|STONEHENGE|TRIPLES|TSIK|WADI|APOLLO|WSRP4J|XAP|RIVER|ROL|SM|SMX4|SMXCOMP|SMX4NMR|SHINDIG|SHIRO|SLING|SQOOP|STR|WW|SB|SITE|XW|SYNAPSE|SYNCOPE|TAPESTRY|TAP5|THRIFT|TIKA|TILES|AUTOTAG|TEVAL|TREQ|TILESSB|TILESSHARED|TILESSHOW|TS|TRB|TUSCANY|UIMA|ANAKIA|DBF|DVSL|TEXEN|VELOCITY|VELOCITYSB|VELTOOLS|AXIOM|NEETHI|WODEN|WSCOMMONS|WSS|XMLRPC|XMLSCHEMA|WHIRR|WICKET|XALANC|XALANJ|XERCESC|XERCESP|XERCESJ|XMLCOMMONS|XMLBEANS|ZOOKEEPER/i;
my %Apache_JIRA_projects = ("ACE", "ACE", "AMQ", "ActiveMQ", "AMQNET", "ActiveMQ .Net", "APLO", "ActiveMQ Apollo", "AMQCPP", "ActiveMQ C++ Client", "BLAZE", "ActiveRealTime", "STOMP", "Stomp Specification", "EASYANT", "EasyAnt", "IVY", "Ivy", "IVYDE", "IvyDE", "ANY23", "Apache Any23", "ATTIC", "Attic", "COMDEV", "Community Development", "INFRA", "Infrastructure", "LEGAL", "Legal Discuss", "PRC", "Public Relations", "ARIES", "Aries", "AVRO", "Avro", "AXIS", "Axis", "AXISCPP", "Axis-C++", "AXIS2", "Axis2", "TRANSPORTS", "Axis2 Transports", "AXIS2C", "Axis2-C", "KAND", "Kandula", "RAMPART", "Rampart", "RAMPARTC", "Rampart/C", "SAND", "Sandesha", "SANDESHA2", "Sandesha2", "SANDESHA2C", "Sandesha2/C", "SAVAN", "Savan", "BIGTOP", "Bigtop", "BUILDR", "Buildr", "BVAL", "BVal", "STDCXX", "C++ Standard Library", "CAMEL", "Camel", "CASSANDRA", "Cassandra", "CAY", "Cayenne", "CMIS", "Chemistry", "CHUKWA", "Chukwa", "CLK", "Click", "CLKE", "Click Eclipse", "CLOUDSTACK", "CloudStack", "COCOON", "Cocoon", "COCOON3", "Cocoon 3", "COMMONSSITE", "Commons All", "ATTRIBUTES", "Commons Attributes", "BCEL", "Commons BCEL", "BEANUTILS", "Commons BeanUtils", "BETWIXT", "Commons Betwixt", "BSF", "Commons BSF", "CHAIN", "Commons Chain", "CLI", "Commons CLI", "CODEC", "Commons Codec", "COLLECTIONS", "Commons Collections", "COMPRESS", "Commons Compress", "CONFIGURATION", "Commons Configuration", "CSV", "Commons CSV", "DAEMON", "Commons Daemon", "DBCP", "Commons Dbcp", "DBUTILS", "Commons DbUtils", "DIGESTER", "Commons Digester", "DISCOVERY", "Commons Discovery", "DORMANT", "Commons Dormant", "EL", "Commons EL", "EMAIL", "Commons Email", "EXEC", "Commons Exec", "FILEUPLOAD", "Commons FileUpload", "FUNCTOR", "Commons Functor", "IMAGING", "Commons Imaging", "IO", "Commons IO", "JCI", "Commons JCI", "JCS", "Commons JCS", "JELLY", "Commons Jelly", "JEXL", "Commons JEXL", "JXPATH", "Commons JXPath", "LANG", "Commons Lang", "LAUNCHER", "Commons Launcher", "LOGGING", "Commons Logging", "MATH", "Commons Math", "MODELER", "Commons Modeler", "NET", "Commons Net", "OGNL", "Commons OGNL", "POOL", "Commons Pool", "PRIMITIVES", "Commons Primitives", "PROXY", "Commons Proxy", "RESOURCES", "Commons Resources", "SANDBOX", "Commons Sandbox", "SANSELAN", "Commons Sanselan", "SCXML", "Commons SCXML", "TRANSACTION", "Commons Transaction", "VALIDATOR", "Commons Validator", "VFS", "Commons VFS", "CB", "Apache Cordova", "COUCHDB", "CouchDB", "RAT", "Apache Rat", "WHISKER", "Apache Whisker", "CRUNCH", "Crunch", "CXF", "CXF", "DOSGI", "CXF Distributed OSGi", "FEDIZ", "CXF-Fediz", "DDLUTILS", "DdlUtils", "DERBY", "Derby", "JDO", "JDO", "TORQUE", "Torque", "TORQUEOLD", "Torque issues (old)", "DIR", "Directory", "DIRSERVER", "Directory ApacheDS", "DIRAPI", "Directory Client API", "DIRGROOVY", "Directory Groovy LDAP", "DIRKRB", "Directory Kerberos", "DIRNAMING", "Directory Naming", "DIRSHARED", "Directory Shared (Please use DIRAPI instead)", "DIRSTUDIO", "Directory Studio", "DIRTSEC", "Triplesec", "ESME", "Enterprise Social Messaging Environment (ESME)", "ETCH", "Etch", "FELIX", "Felix", "FLUME", "Flume", "FOR", "Forrest", "DAYTRADER", "DayTrader", "GBUILD", "GBuild", "GERONIMO", "Geronimo", "GERONIMODEVTOOLS", "Geronimo-Devtools", "GSHELL", "GShell", "XBEAN", "XBean", "YOKO", "Yoko - CORBA Server", "GIRAPH", "Giraph", "GORA", "Apache Gora", "GUMP", "Gump", "HADOOP", "Hadoop Common", "HDFS", "Hadoop HDFS", "MAPREDUCE", "Hadoop Map/Reduce", "YARN", "Hadoop YARN", "HBASE", "HBase", "HIVE", "Hive", "PIG", "Pig", "HAMA", "Hama", "MODPYTHON", "mod_python", "HTTPASYNC", "HttpComponents HttpAsyncClient", "HTTPCLIENT", "HttpComponents HttpClient", "HTTPCORE", "HttpComponents HttpCore", "AMBARI", "Ambari", "AMBER", "Amber", "AWF", "Apache AWF", "BLUR", "Apache Blur", "DIRECTMEMORY", "Apache DirectMemory", "DRILL", "Apache Drill", "HELIX", "Apache Helix", "S4", "Apache S4", "CELIX", "Celix", "CLEREZZA", "Clerezza", "CTAKES", "cTAKES", "DELTASPIKE", "DeltaSpike", "DMAP", "DeviceMap", "DROIDS", "Droids", "EMPIREDB", "Empire-DB", "FALCON", "Falcon", "HCATALOG", "HCatalog", "INCUBATOR", "Incubator", "JCLOUDS", "jclouds", "JSPWIKI", "JSPWiki", "KALUMET", "Kalumet", "KITTY", "Kitty", "LUCENENET", "Lucene.Net", "MARMOTTA", "Marmotta", "MESOS", "Mesos", "MRQL", "MRQL", "NPANDAY", "NPanday", "NUVEM", "Nuvem", "ODFTOOLKIT", "ODF Toolkit", "PODLINGNAMESEARCH", "Podling Suitable Names Search", "SIS", "Spatial Information Systems", "STANBOL", "Stanbol", "TASHI", "Tashi", "VCL", "VCL", "WOOKIE", "Wookie", "ZETACOMP", "Zeta Components", "ISIS", "Isis", "JCR", "Jackrabbit Content Repository", "JCRBENCH", "Jackrabbit JCR Benchmark", "JCRCL", "Jackrabbit JCR Classloader", "JCRSERVLET", "Jackrabbit JCR Servlets", "JCRTCK", "Jackrabbit JCR Tests", "JCRRMI", "Jackrabbit JCR-RMI", "OAK", "Jackrabbit Oak", "OCM", "Jackrabbit OCM", "JCRSITE", "Jackrabbit Site", "IMAP", "James Imap", "JSIEVE", "James jSieve", "JSPF", "James jSPF", "MAILET", "James Mailet", "MIME4J", "James Mime4j", "MPT", "James MPT", "POSTAGE", "James Postage", "PROTOCOLS", "James Protocols", "JAMES", "James Server", "JENA", "Apache Jena", "JUDDI", "jUDDI", "SCOUT", "Scout", "KAFKA", "Kafka", "KARAF", "Karaf", "LABS", "Labs", "HTTPDRAFT", "Labs WebArch draft-fielding-http", "LIBCLOUD", "Libcloud", "LOGCXX", "Log4cxx", "LOG4J2", "Log4j 2", "LOG4NET", "Log4net", "LOG4PHP", "Log4php", "LUCENE", "Lucene - Core", "LUCY", "Lucy", "MAHOUT", "Mahout", "ORP", "Open Relevance Project ", "PYLUCENE", "PyLucene", "SOLR", "Solr", "CONNECTORS", "ManifoldCF", "MPOM", "Maven POMs", "ASYNCWEB", "Asyncweb", "FTPSERVER", "FtpServer", "DIRMINA", "MINA", "SSHD", "MINA SSHD", "VYSPER", "VYSPER", "MRUNIT", "MRUnit", "ADFFACES", "MyFaces ADF-Faces", "EXTCDI", "MyFaces CODI", "MFCOMMONS", "MyFaces Commons", "MYFACES", "MyFaces Core", "EXTSCRIPT", "MyFaces Extensions Scripting", "EXTVAL", "MyFaces Extensions Validator", "MFHTML5", "MyFaces HTML5 Component Library", "ORCHESTRA", "MyFaces Orchestra", "PORTLETBRIDGE", "MyFaces Portlet Bridge", "MYFACESTEST", "MyFaces Test", "TOBAGO", "MyFaces Tobago", "TOMAHAWK", "MyFaces Tomahawk", "TRINIDAD", "MyFaces Trinidad", "NUTCH", "Nutch", "ODE", "ODE", "OFBIZ", "OFBiz", "OODT", "OODT", "OOZIE", "Oozie", "OPENEJB", "OpenEJB", "OEP", "OpenEJB Eclipse Plugin", "TOMEE", "TomEE", "OPENJPA", "OpenJPA", "OPENMEETINGS", "Openmeetings", "OPENNLP", "OpenNLP", "OWB", "OpenWebBeans", "PDFBOX", "PDFBox", "PIVOT", "Pivot", "JS1", "Jetspeed", "JS2", "Jetspeed 2", "PLUTO", "Pluto", "PORTALS", "Portals", "APA", "Portals Apps", "PB", "Portals Bridges", "QPID", "Qpid", "PROTON", "Qpid Proton", "AGILA", " Agila", "ADDR", "Addressing", "ALOIS", "ALOIS", "ARMI", "AltRMI", "AVALON", "Avalon", "AVNSHARP", "Avalon Castle", "RUNTIME", "Avalon Merlin Runtime", "STUDIO", "Avalon Merlin Studio", "CENTRAL", "Avalon Metro Central", "PLANET", "Avalon Metro Planet", "TOOLS", "Avalon Metro Tools", "WSIF", "Axis-WSIF", "BEEHIVE", "Beehive", "BLUESKY", "Bluesky", "CACTUS", "Cactus", "FEEDPARSER", "Commons FeedParser", "DEPOT", "Depot", "ECS", "ECS", "EWS", "ews", "EXLBR", "Excalibur Components", "FORTRESS", "Excalibur Fortress", "GRFT", "Graffito", "HARMONY", "Harmony", "HERALDRY", "Heraldry", "HISE", "HISE", "HIVEMIND", "HiveMind", "IBATISNET", "iBatis for .NET", "IBATIS", "iBatis for Java [READ ONLY]", "RBATIS", "iBATIS for Ruby", "IMPERIUS", "Imperius", "JAXME", "JaxMe", "JSEC", "JSecurity", "KATO", "Kato", "KI", "Ki", "LOKAHI", "Lokahi", "LCN4C", "Lucene4c", "MIRAE", "Mirae", "MUSE", "Muse", "OJB", "OJB", "OLIO", "Olio", "PNIX", "Phoenix", "PHOTARK", "PhotArk", "HERMES", "Pubscribe", "SMX4KNL", "ServiceMix Kernel", "SHALE", "Shale", "SOAP", "SOAP", "STONEHENGE", "Stonehenge", "TRIPLES", "TripleSoup", "TSIK", "TSIK", "WADI", "WADI", "APOLLO", "WSRF", "WSRP4J", "WSRP4J", "XAP", "XAP", "RIVER", "River", "ROL", "Roller", "SM", "ServiceMix", "SMX4", "ServiceMix 4", "SMXCOMP", "ServiceMix Components", "SMX4NMR", "ServiceMix NMR", "SHINDIG", "Shindig", "SHIRO", "Shiro", "SLING", "Sling", "SQOOP", "Sqoop", "STR", "Struts 1", "WW", "Struts 2", "SB", "Struts Sandbox", "SITE", "Struts Shared Resources", "XW", "XWork", "SYNAPSE", "Synapse", "SYNCOPE", "Syncope", "TAPESTRY", "Tapestry", "TAP5", "Tapestry 5", "THRIFT", "Thrift", "TIKA", "Tika", "TILES", "Tiles", "AUTOTAG", "Tiles Autotag", "TEVAL", "Tiles Eval", "TREQ", "Tiles Request", "TILESSB", "Tiles Sandbox", "TILESSHARED", "Tiles Shared Resources", "TILESSHOW", "Tiles Showcase", "TS", "Traffic Server", "TRB", "Turbine", "TUSCANY", "Tuscany", "UIMA", "UIMA", "ANAKIA", "Anakia", "DBF", "DocBook Framework", "DVSL", "Dvsl", "TEXEN", "Texen", "VELOCITY", "Velocity", "VELOCITYSB", "Velocity Sandbox", "VELTOOLS", "Velocity Tools", "AXIOM", "Axiom", "NEETHI", "Neethi", "WODEN", "Woden", "WSCOMMONS", "WS-Commons", "WSS", "WSS4J", "XMLRPC", "XML-RPC", "XMLSCHEMA", "XmlSchema", "WHIRR", "Whirr", "WICKET", "Wicket", "XALANC", "XalanC", "XALANJ", "XalanJ2", "XERCESC", "Xerces-C++", "XERCESP", "Xerces-P", "XERCESJ", "Xerces2-J", "XMLCOMMONS", "XML Commons", "XMLBEANS", "XMLBeans", "ZOOKEEPER", "ZooKeeper"); 


# Referencing Codehaus JIRA project keys.
# reference: http://jira.codehaus.org/secure/BrowseProjects.jspa#all
# A ticket identifier is formed by the key of the project and a number: KEY-NUMBER.
my $Codehaus_JIRA_keys = qr/AJLIB|AW|AWARE|NAN|OSLO|DNA|EOB|GRAILS|JCT|LOOM|NANO|PICO|PLX|PLXCOMP|PLXUTILS|DISPL|GBEAN|LIVETRIBE|GEO|GEOS|GEOT|UDIG|BOO|GROOVY|MMLD|MPABBOT|MPANNOUNCEMENT|MPANT|MPANTLR|MPGENAPP|MPAPPSERVER|MPARTIFACT|MPASHKELON|MPASPECTJ|MPASPECTWERKZ|MPCALLER|MPCASTOR|MPCHANGELOG|MPCHANGES|MPCHECKSTYLE|MPCLEAN|MPCLOVER|MPCONSOLE|MPCRUISECONTROL|MPDASHBOARD|MPDEVACTIVITY|MPDIST|MPDOCBOOK|MPEAR|MPECLIPSE|MPEJB|MPFAQ|MPFILEACTIVITY|MPGUMP|MPHIBERNATE|MPHTMLXDOC|MPIDEA|MPJEE|MPJALOPY|MPJAR|MPJAVA|MPJAVACC|MPJAVADOC|MPJBOSS|MPJBUILDER|MPJCOVERAGE|MPJDEE|MPJDEPEND|MPJDEVELOPER|MPJDIFF|MPJELLYDOC|MPJETTY|MPJIRA|MPJNLP|MPJUNITREPORT|MPJUNITDOCLET|MPJXR|MPLATEX|MPLATKA|MPLICENSE|MPLINKCHECK|MPMODELLO|MPMULTIPROJECT|MPMULTICHANGES|MPNATIVE|MPNSIS|MPPDF|MPPLUGIN|MPPMD|MPPOM|MPRAR|MPRELEASE|MPREPO|MPSCM|MPSHELL|MPSIMIAN|MPSITE|MPSOURCE|MPSTRUTS|MPTASKLIST|MPTEST|MPTJDO|MPUBERJAR|MPVDOCLET|MPWAR|MPWEBSERVER|MPWIZARD|MPXDOC|GMAVEN|MGROOVY|MHIBERNATE|MJAXB|MDEPLOY|MGPG|MSITE|MANT|MANTLR|MANTLRTHREE|MANTRUN|MASSEMBLY|MAXISTOOLS|MBUILDHELPER|MCASTOR|MCHANGELOG|MCHANGES|MCHECKSTYLE|MCLEAN|MCLIRR|MCOBERTURA|MCOMATTR|MCOMPILER|MIDLJ|MDEP|MDOAP|MDOCCK|MEAR|MECLIPSE|MEJB|MENFORCER|MEXEC|MFINDBUGS|MFIT|MFITNESSE|MGAE|MPH|MIDEA|MINSTALL|MINVOKER|MJAR|MJARSIGNER|MJAVACC|MJAVADOC|MJNCSS|MJBOSSPACK|MJBOSS|MJDIFF|MJPOX|MJSPC|MKEYTOOL|MLINKCHECK|MNETBEANSFREEFORM|MONE|MOUNCE|MPATCH|MPDF|MPLUGIN|MPMD|MPIR|MRAR|MREACTOR|MRELEASE|MRRESOURCES|MREPOSITORY|MRESOURCES|MRETRO|MRMIC|MSABLECC|MSCMCHGLOG|MSELENIUM|MSHADE|MSHITTY|MSOURCES|MSQL|MSTAGE|MTAGLIST|MTOOLCHAINS|MVERIFIER|MVERSIONS|MWAR|MWAS|MWEBSTART|MWEBTEST|MXMLBEANS|MACR|MGWT|MJS|MNBMODULE|MSCMPUB|MOJO|MANIMALSNIFFER|MAPPASM|MASPECTJ|MBUILDNUM|CBUILDS|MEMMA|MJSIMP|MLATEX|MRPM|MSQLJ|MSYSDEO|MWEBMINI|MCASSANDRA|MCHRONOS|MJSLINT|MLICENSE|MMOCKRM|MSONAR|MNGBOOK|MEV|MNGFAQ|MPA|MNGSITE|MAVENUPLOAD|MPOM|MRM|MAVEN|MNG|MANTTASKS|MPLUGINTESTING|MSANDBOX|ARCHETYPE|MARCHETYPES|DOXIA|DOXIASITETOOLS|DOXIATOOLS|MINDEXER|MNGECLIPSE|JXR|SCM|MSHARED|MSKINS|SUREFIRE|WAGON|MAVENPROXY|MERCURY|MEVENIDE|MNGTEST|NMAVEN|PROFICIO|CASTOR|DATAFORGE|JIBX|PRV|XSTR|XPR|ASH|CONTINUUM|DC|JBEHAVE|QUILT|SYSUNIT|FAQBOT|OXYD|SONAR|SONARDOTNT|SONARIDE|SONARJAVA|SONARJNKNS|SONARPLUGINS|XDOCLET|XDP|ACT|AWN|VIXTORY|STORIES|AGILIFIER|ANDROMDA|ANNOGEN|ANTOMOLOGY|APPINFO|ATOMSERVER|BP|BENJI|BERKANO|BLISSED|BRUCE|BTM|CAKE|CARGO|CHEN|CLASSWORLDS|COCACHE|COM|CJCOOK|MAP|CONSTELLATION|CUANTO|DACCO|DAVOS|DBUNIT|DENTAKU|DFORMS|DIMPLE|DW|DRONE|DROOLS|DROOLSDOTNET|DH|DYNJS|EASYOVF|EASYMOCK|EDUS|EINSTEIN|ENUNCIATE|ERA|ESPER|EUREKAJ|FABRICTHREE|FCBK|FEST|FITWEB|FOCI|GABRIEL|GANT|GEB|GEMS|GENCORE|GRA|GREPO|GEOBATCH|GEOTRACING|GLDP|GPARS|GP|GFS|GLOG|GRAILSPLUGINS|GRAPHPROC|GRECLIPSE|GREENMAIL|GRIFFON|GCIDE|GMOD|GFX|GRUPLE|GUESSENC|GUFF|GUMTREE|GWTOPENLAYERS|HAUS|HAUSMOB|HTCJ|HYDRACACHE|HJ|IDEACLEARCASE|IDEAJUNIT|IOKE|IUI|IVYNET|IZPACK|JSQL|JACKSON|JANINO|JASKELL|VG|JAVANCSS|JSDI|JAVASIM|JAXBITTY|JAXEN|JW|JBL|JCSP|JDBI|JDBM|JEDI|JEQUEL|JET|JETTISON|JETTY|JFDI|JGEOCODER|JIBE|JMETERPLUGIN|JPARSEC|JR|JRUBY|JSTR|JSEC|JSRCONCURRENCYMIRROR|JTESTME|JTESTR|JTSTAND|JVALIDATIONS|KEWLANG|KEYMG|KOLJA|LABSNG|LAREX|LINGO|LITHA|LOGICABYSS|MAPFACES|MARCH|MARNET|MNGIDEA|MOPENJPA|MTOMCAT|MUNIX|MVNBLAME|MVNCONFSITE|MDBUNIT|MAVENENTERPRISE|PSEUDOTRANS|MDWEB|MSR|METAPP|MRP|META|MICRO|MICROMEETING|MIDDLEGEN|MILYN|MINGLYN|MOCKINJECT|MODFORJ|MODELLO|MWEBLOGIC|MSITESKIN|MTRUEZIP|MULTIVERSE|MVEL|MVFLEX|MYTIMES|NANOIOC|NANOWAR|NANOPERSISTENCE|NANOREMOTING|NANOSANDBOX|NANOTOOLS|NEO|NEST|OAUTHSS|OORT|OPENEMPI|OPENEJB|OPENIM|OPENPIPELINE|OPENTCDB|OPENXMA|OXFJORD|PARANAMER|PASSERELLE|PERFFORJ|PERPETUUM|PHYSIOME|PICOBOOK|PICOPLUGINS|PICOUNIT|PININ|PLJ|PLATYPUS|PLXASRVR|POLYMAP|PREON|PROM|PROPHIT|PTOYS|PUZZLEGIS|QDOX|QIXWEB|QUAERE|REDBACK|RUBYRULES|RVM|SVNA|SCRUMTIME|SENRO|SERVICECONDUIT|SERVICESTUDIO|SETPOINT|SHOCKS|SIMJP|SSSO|SXC|SIPO|SOT|SPICE|SQUIGGLE|STAX|STAXMATE|STOMP|SVNJ|SWIBY|SWIZZLE|SYMMETRICDS|TEST|TESTORIENTED|TESTDOX|TIX|TIMTAM|TRAILS|TQL|TYNAMO|UISPEC|UMP|WADI|WAFFLE|WERKFLOW|WERKZ|WSTX|XTENLANG|XB|XDASJ|XFIRE|XHARNESS|XJB|XLITE|XEVPP|XSITE|XULUX|XWIRE|YAGLL|YAN|YFACES|YUMAFRAMEWORK|ZONEINFOTZ/i;
my %Codehaus_JIRA_projects = ("AJLIB", "ajlib incubator", "AW", "AspectWerkz", "AWARE", "AWare", "NAN", "nanning", "OSLO", "oslo", "DNA", "dna", "EOB", "Enterprise Object Broker", "GRAILS", "Grails", "JCT", "JContainer", "LOOM", "loom", "NANO", "NanoContainer", "PICO", "PicoContainer", "PLX", "Plexus", "PLXCOMP", "Plexus Components", "PLXUTILS", "Plexus Utils", "DISPL", "DisplayTag", "GBEAN", "GBean", "LIVETRIBE", "LiveTribe", "GEO", "GeoAPI", "GEOS", "GeoServer", "GEOT", "GeoTools", "UDIG", "uDIG", "BOO", "Boo", "GROOVY", "groovy", "MMLD", "Marmalade", "MPABBOT", "Maven 1.x Abbot Plugin", "MPANNOUNCEMENT", "Maven 1.x Announcement Plugin", "MPANT", "Maven 1.x Ant Plugin", "MPANTLR", "Maven 1.x Antlr Plugin", "MPGENAPP", "Maven 1.x Application Generation Plugin", "MPAPPSERVER", "Maven 1.x AppServer Plugin", "MPARTIFACT", "Maven 1.x Artifact Plugin", "MPASHKELON", "Maven 1.x Ashkelon Plugin", "MPASPECTJ", "Maven 1.x AspectJ Plugin", "MPASPECTWERKZ", "Maven 1.x AspectWerkz Plugin", "MPCALLER", "Maven 1.x Caller Plugin", "MPCASTOR", "Maven 1.x Castor Plugin", "MPCHANGELOG", "Maven 1.x Changelog Plugin", "MPCHANGES", "Maven 1.x Changes Plugin", "MPCHECKSTYLE", "Maven 1.x Checkstyle Plugin", "MPCLEAN", "Maven 1.x Clean Plugin", "MPCLOVER", "Maven 1.x Clover Plugin", "MPCONSOLE", "Maven 1.x Console Plugin", "MPCRUISECONTROL", "Maven 1.x CruiseControl Plugin", "MPDASHBOARD", "Maven 1.x Dashboard Plugin", "MPDEVACTIVITY", "Maven 1.x Developer Activity Plugin", "MPDIST", "Maven 1.x Distribution Plugin", "MPDOCBOOK", "Maven 1.x DocBook Plugin", "MPEAR", "Maven 1.x Ear Plugin", "MPECLIPSE", "Maven 1.x Eclipse Plugin", "MPEJB", "Maven 1.x EJB Plugin", "MPFAQ", "Maven 1.x FAQ Plugin", "MPFILEACTIVITY", "Maven 1.x File Activity Plugin", "MPGUMP", "Maven 1.x Gump Plugin", "MPHIBERNATE", "Maven 1.x Hibernate Plugin", "MPHTMLXDOC", "Maven 1.x Html2XDoc Plugin", "MPIDEA", "Maven 1.x IDEA Plugin", "MPJEE", "Maven 1.x J2EE Plugin", "MPJALOPY", "Maven 1.x Jalopy Plugin", "MPJAR", "Maven 1.x Jar Plugin", "MPJAVA", "Maven 1.x Java Plugin", "MPJAVACC", "Maven 1.x JavaCC Plugin", "MPJAVADOC", "Maven 1.x Javadoc Plugin", "MPJBOSS", "Maven 1.x JBoss Plugin", "MPJBUILDER", "Maven 1.x JBuilder Plugin", "MPJCOVERAGE", "Maven 1.x JCoverage Plugin", "MPJDEE", "Maven 1.x JDEE Plugin", "MPJDEPEND", "Maven 1.x JDepend Plugin", "MPJDEVELOPER", "Maven 1.x JDeveloper Plugin", "MPJDIFF", "Maven 1.x JDiff Plugin", "MPJELLYDOC", "Maven 1.x JellyDoc Plugin", "MPJETTY", "Maven 1.x Jetty Plugin", "MPJIRA", "Maven 1.x JIRA Plugin", "MPJNLP", "Maven 1.x JNLP Plugin", "MPJUNITREPORT", "Maven 1.x JUnit Report Plugin", "MPJUNITDOCLET", "Maven 1.x JUnitDoclet Plugin", "MPJXR", "Maven 1.x JXR Plugin", "MPLATEX", "Maven 1.x Latex Plugin", "MPLATKA", "Maven 1.x Latka Plugin", "MPLICENSE", "Maven 1.x License Plugin", "MPLINKCHECK", "Maven 1.x LinkCheck Plugin", "MPMODELLO", "Maven 1.x Modello Plugin", "MPMULTIPROJECT", "Maven 1.x Multi-Project Plugin", "MPMULTICHANGES", "Maven 1.x MultiChanges Plugin", "MPNATIVE", "Maven 1.x Native Plugin", "MPNSIS", "Maven 1.x NSIS Plugin", "MPPDF", "Maven 1.x PDF Plugin", "MPPLUGIN", "Maven 1.x Plugin Plugin", "MPPMD", "Maven 1.x PMD Plugin", "MPPOM", "Maven 1.x POM Plugin", "MPRAR", "Maven 1.x RAR Plugin", "MPRELEASE", "Maven 1.x Release Plugin", "MPREPO", "Maven 1.x Repository Plugin", "MPSCM", "Maven 1.x SCM Plugin", "MPSHELL", "Maven 1.x Shell Plugin", "MPSIMIAN", "Maven 1.x Simian Plugin", "MPSITE", "Maven 1.x Site Plugin", "MPSOURCE", "Maven 1.x Source Plugin", "MPSTRUTS", "Maven 1.x Struts Plugin", "MPTASKLIST", "Maven 1.x Tasklist Plugin", "MPTEST", "Maven 1.x Test Plugin", "MPTJDO", "Maven 1.x TJDO Plugin", "MPUBERJAR", "Maven 1.x UberJar Plugin", "MPVDOCLET", "Maven 1.x VDoclet Plugin", "MPWAR", "Maven 1.x War Plugin", "MPWEBSERVER", "Maven 1.x Webserver Plugin", "MPWIZARD", "Maven 1.x Wizard Plugin", "MPXDOC", "Maven 1.x XDoc Plugin", "GMAVEN", "GMaven", "MGROOVY", "GMaven (OLD... DO NOT USE)", "MHIBERNATE", "Hibernate3 Maven Plugin", "MJAXB", "JAXB-2 Maven Plugin", "MDEPLOY", "Maven 2.x and 3.x Deploy Plugin", "MGPG", "Maven 2.x and 3.x GPG Plugin", "MSITE", "Maven 2.x and 3.x Site Plugin", "MANT", "Maven 2.x Ant Plugin", "MANTLR", "Maven 2.x Antlr Plugin", "MANTLRTHREE", "Maven 2.x Antlr3 Plugin", "MANTRUN", "Maven 2.x Antrun Plugin", "MASSEMBLY", "Maven 2.x Assembly Plugin", "MAXISTOOLS", "Maven 2.x Axis Tools Plugin", "MBUILDHELPER", "Maven 2.x Build Helper Plugin", "MCASTOR", "Maven 2.x Castor Plugin", "MCHANGELOG", "Maven 2.x Changelog Plugin", "MCHANGES", "Maven 2.x Changes Plugin", "MCHECKSTYLE", "Maven 2.x Checkstyle Plugin", "MCLEAN", "Maven 2.x Clean Plugin", "MCLIRR", "Maven 2.x Clirr Plugin", "MCOBERTURA", "Maven 2.x Cobertura Plugin", "MCOMATTR", "Maven 2.x Commons Attributes Plugin", "MCOMPILER", "Maven 2.x Compiler Plugin", "MIDLJ", "Maven 2.x CORBA IDL Compiler Plugin", "MDEP", "Maven 2.x Dependency Plugin", "MDOAP", "Maven 2.x DOAP Plugin", "MDOCCK", "Maven 2.x Documentation Checker Plugin", "MEAR", "Maven 2.x Ear Plugin", "MECLIPSE", "Maven 2.x Eclipse Plugin", "MEJB", "Maven 2.x EJB Plugin", "MENFORCER", "Maven 2.x Enforcer Plugin", "MEXEC", "Maven 2.x Exec Plugin", "MFINDBUGS", "Maven 2.x FindBugs Plugin", "MFIT", "Maven 2.x FIT Plugin", "MFITNESSE", "Maven 2.x Fitnesse Plugin", "MGAE", "Maven 2.x GAE Plugin", "MPH", "Maven 2.x Help Plugin", "MIDEA", "Maven 2.x IDEA Plugin", "MINSTALL", "Maven 2.x Install Plugin", "MINVOKER", "Maven 2.x Invoker Plugin", "MJAR", "Maven 2.x JAR Plugin", "MJARSIGNER", "Maven 2.x Jar Signer Plugin", "MJAVACC", "Maven 2.x JavaCC Plugin", "MJAVADOC", "Maven 2.x Javadoc Plugin", "MJNCSS", "Maven 2.x JavaNCSS Plugin", "MJBOSSPACK", "Maven 2.x JBoss Packaging Plugin", "MJBOSS", "Maven 2.x JBoss Plugin", "MJDIFF", "Maven 2.x JDiff Plugin", "MJPOX", "Maven 2.x JPox Plugin", "MJSPC", "Maven 2.x JSPC Plugin", "MKEYTOOL", "Maven 2.x Keytool Plugin", "MLINKCHECK", "Maven 2.x Linkcheck Plugin", "MNETBEANSFREEFORM", "Maven 2.x Netbeans Freeform Plugin (retired)", "MONE", "Maven 2.x One Plugin", "MOUNCE", "Maven 2.x Ounce Plugin", "MPATCH", "Maven 2.x Patch Plugin", "MPDF", "Maven 2.x PDF Plugin", "MPLUGIN", "Maven 2.x Plugin Tools", "MPMD", "Maven 2.x PMD Plugin", "MPIR", "Maven 2.x Project Info Reports Plugin", "MRAR", "Maven 2.x Rar Plugin", "MREACTOR", "Maven 2.x Reactor Plugin", "MRELEASE", "Maven 2.x Release Plugin", "MRRESOURCES", "Maven 2.x Remote Resources Plugin", "MREPOSITORY", "Maven 2.x Repository Plugin", "MRESOURCES", "Maven 2.x Resources Plugin", "MRETRO", "Maven 2.x Retrotranslator Plugin", "MRMIC", "Maven 2.x RMIC Plugin", "MSABLECC", "Maven 2.x SableCC Plugin", "MSCMCHGLOG", "Maven 2.x SCM Changelog Plugin", "MSELENIUM", "Maven 2.x Selenium Plugin", "MSHADE", "Maven 2.x Shade Plugin", "MSHITTY", "Maven 2.x SHITTY Plugin", "MSOURCES", "Maven 2.x Source Plugin", "MSQL", "Maven 2.x SQL Plugin", "MSTAGE", "Maven 2.x Stage Plugin", "MTAGLIST", "Maven 2.x Taglist Plugin", "MTOOLCHAINS", "Maven 2.x Toolchains Plugin", "MVERIFIER", "Maven 2.x Verifier Plugin", "MVERSIONS", "Maven 2.x Versions Plugin", "MWAR", "Maven 2.x WAR Plugin", "MWAS", "Maven 2.x WebSphere 6 Plugin", "MWEBSTART", "Maven 2.x Webstart Plugin", "MWEBTEST", "Maven 2.x Webtest plugin", "MXMLBEANS", "Maven 2.x Xmlbeans Plugin", "MACR", "Maven ACR Plugin", "MGWT", "Maven GWT Plugin", "MJS", "Maven Javascript Tools", "MNBMODULE", "Maven NetBeans Module Plugin", "MSCMPUB", "maven-scm-publish-plugin", "MOJO", "Mojo", "MANIMALSNIFFER", "Mojo Animal Sniffer", "MAPPASM", "Mojo AppAssembler Plugin", "MASPECTJ", "Mojo AspectJ Plugin", "MBUILDNUM", "Mojo Build Number Maven Plugin", "CBUILDS", "Mojo C Builds", "MEMMA", "Mojo EMMA Plugin", "MJSIMP", "Mojo JavaScript Import Maven Plugin", "MLATEX", "Mojo Latex Maven Plugin", "MRPM", "Mojo RPM Plugin", "MSQLJ", "Mojo SQLJ Plugin", "MSYSDEO", "Mojo Sysdeo Tomcat Plugin", "MWEBMINI", "Mojo Web Minifier Maven Plugin", "MCASSANDRA", "Mojo\'s Cassandra Maven Plugin", "MCHRONOS", "Mojo\'s Chronos Maven Plugins", "MJSLINT", "Mojo\'s JSLint Maven Plugin", "MLICENSE", "Mojo\'s License Maven Plugin", "MMOCKRM", "Mojo\'s Mock Repository Manager", "MSONAR", "Mojo\'s Sonar Maven Plugin", "MNGBOOK", "m2book", "MEV", "Maven Evangelism", "MNGFAQ", "Maven FAQ", "MPA", "Maven Project Administration", "MNGSITE", "Maven Project Web Site", "MAVENUPLOAD", "Maven Upload Requests", "MPOM", "Apache or Maven Parent POMs", "MRM", "Archiva", "MAVEN", "Maven 1", "MNG", "Maven 2 &amp; 3", "MANTTASKS", "Maven 2.x Ant Tasks", "MPLUGINTESTING", "Maven 2.x Plugin Testing", "MSANDBOX", "Maven 2.x Sandbox", "ARCHETYPE", "Maven Archetype", "MARCHETYPES", "Maven Archetype Bundles", "DOXIA", "Maven Doxia", "DOXIASITETOOLS", "Maven Doxia Sitetools", "DOXIATOOLS", "Maven Doxia Tools", "MINDEXER", "Maven Indexer", "MNGECLIPSE", "Maven Integration for Eclipse", "JXR", "Maven JXR", "SCM", "Maven SCM", "MSHARED", "Maven Shared Components", "MSKINS", "Maven Skins", "SUREFIRE", "Maven Surefire", "WAGON", "Maven Wagon", "MAVENPROXY", "maven-proxy", "MERCURY", "Mercury (retired)", "MEVENIDE", "mevenide", "MNGTEST", "MNG Test", "NMAVEN", "NMaven (Retired)", "PROFICIO", "Proficio", "CASTOR", "castor", "DATAFORGE", "dataforge", "JIBX", "JiBX", "PRV", "prevayler", "XSTR", "XStream", "XPR", "xplanner", "ASH", "Ashcroft", "CONTINUUM", "Continuum", "DC", "DamageControl", "JBEHAVE", "JBehave", "QUILT", "Quilt", "SYSUNIT", "sysunit", "FAQBOT", "Faqbot", "OXYD", "Oxyd", "SONAR", "Sonar", "SONARDOTNT", "Sonar .NET Ecosystem", "SONARIDE", "Sonar Eclipse", "SONARJAVA", "Sonar Java", "SONARJNKNS", "Sonar Jenkins", "SONARPLUGINS", "Sonar Plugins", "XDOCLET", "XDoclet 2", "XDP", "XDoclet 2 Plugins", "ACT", "Activiti", "AWN", "adarwin", "VIXTORY", "Agile Requirements Management", "STORIES", "Agile Stories", "AGILIFIER", "Agilifier", "ANDROMDA", "AndroMDA Model-Driven Architecture", "ANNOGEN", "Annogen", "ANTOMOLOGY", "Antomology", "APPINFO", "AppInfo", "ATOMSERVER", "AtomServer", "BP", "backport175", "BENJI", "Benji", "BERKANO", "Berkano", "BLISSED", "blissed", "BRUCE", "Bruce", "BTM", "BTM", "CAKE", "Cake", "CARGO", "Cargo", "CHEN", "ChenilleKit", "CLASSWORLDS", "classworlds", "COCACHE", "Coconut Cache", "COM", "Codehaus commons", "CJCOOK", "Common Java Cookbook", "MAP", "Community Mapbuilder", "CONSTELLATION", "Constellation", "CUANTO", "Cuanto", "DACCO", "DACCO", "DAVOS", "Davos", "DBUNIT", "dbUnit", "DENTAKU", "Dentaku", "DFORMS", "DForms", "DIMPLE", "Dimple", "DW", "domainWorkbench", "DRONE", "Drone", "DROOLS", "drools-legacy", "DROOLSDOTNET", "DroolsDotNet", "DH", "Duck Hawk", "DYNJS", "dynjs", "EASYOVF", "easy OVF", "EASYMOCK", "EasyMock", "EDUS", "Eclipse Dynamic Update Server", "EINSTEIN", "Einstein", "ENUNCIATE", "Enunciate", "ERA", "ERA", "ESPER", "Esper", "EUREKAJ", "EurekaJ", "FABRICTHREE", "Fabric3", "FCBK", "FCBKComplete", "FEST", "FEST", "FITWEB", "Fitnesse Web", "FOCI", "Foci", "GABRIEL", "Gabriel", "GANT", "Gant", "GEB", "Geb", "GEMS", "Gems", "GENCORE", "genCore", "GRA", "Generama", "GREPO", "Generic Repository", "GEOBATCH", "GeoBatch", "GEOTRACING", "GeoTracing", "GLDP", "Gldapo", "GPARS", "gpars (Groovy Parallel Systems)", "GP", "GParsec", "GFS", "Grails Flex Scaffold", "GLOG", "Grails Log", "GRAILSPLUGINS", "Grails Plugins", "GRAPHPROC", "Graph Processor", "GRECLIPSE", "GRECLIPSE", "GREENMAIL", "GreenMail", "GRIFFON", "Griffon", "GCIDE", "Groovy Commons IDE", "GMOD", "Groovy Modules", "GFX", "GroovyFX", "GRUPLE", "Gruple", "GUESSENC", "GuessEncoding", "GUFF", "Guff", "GUMTREE", "Gumtree", "GWTOPENLAYERS", "GWT OpenLayers plugin", "HAUS", "Haus Chores", "HAUSMOB", "Hausmob", "HTCJ", "HTTP Cache For Java", "HYDRACACHE", "Hydra Cache", "HJ", "Hyperjaxb3", "IDEACLEARCASE", "idea-clearcase-plugin", "IDEAJUNIT", "idea-junit-plugin", "IOKE", "Ioke", "IUI", "iUI Plugin", "IVYNET", "Ivy.NET", "IZPACK", "IzPack", "JSQL", "j4sql", "JACKSON", "Jackson JSON Processor", "JANINO", "Janino", "JASKELL", "Jaskell", "VG", "Java Vector Graphics", "JAVANCSS", "JavaNCSS", "JSDI", "JavaScript Dependency Injection", "JAVASIM", "JavaSim", "JAXBITTY", "JAX-Bitty", "JAXEN", "jaxen", "JW", "JayWalker", "JBL", "JBloglines", "JCSP", "JCSP", "JDBI", "jDBI", "JDBM", "jdbm", "JEDI", "Jedi", "JEQUEL", "JEQUEL", "JET", "JET", "JETTISON", "Jettison", "JETTY", "Jetty", "JFDI", "JFDI", "JGEOCODER", "JGeocoder - Free Java Geocoder", "JIBE", "jibe", "JMETERPLUGIN", "JMeter Plugin", "JPARSEC", "JParsec", "JR", "JRemoting", "JRUBY", "JRuby", "JSTR", "JS Test Runner", "JSEC", "JSecurity", "JSRCONCURRENCYMIRROR", "JSR166 Mirror", "JTESTME", "JTestMe", "JTESTR", "JtestR", "JTSTAND", "jtstand", "JVALIDATIONS", "jvalidations", "KEWLANG", "kew", "KEYMG", "KeyMG", "KOLJA", "Kolja", "LABSNG", "Labs NG", "LAREX", "Larex", "LINGO", "Lingo", "LITHA", "Litha-Paint", "LOGICABYSS", "Logic Abyss", "MAPFACES", "MapFaces", "MARCH", "March", "MARNET", "Marionette", "MNGIDEA", "Maven 2.x IDEA Integration", "MOPENJPA", "Maven 2.x OpenJPA Plugin", "MTOMCAT", "Maven 2.x Tomcat Plugin", "MUNIX", "Maven 2.x Unix Plugin", "MVNBLAME", "maven blame plugin", "MVNCONFSITE", "maven confluence site plugin", "MDBUNIT", "Maven DbUnit Plugin", "MAVENENTERPRISE", "Maven Enterprise", "PSEUDOTRANS", "Maven Pseudo L10n Plugin", "MDWEB", "MDweb", "MSR", "Messenger", "METAPP", "Meta++", "MRP", "Metacircular Research Platform", "META", "MetaClass", "MICRO", "MicroContainer", "MICROMEETING", "MicroMeeting", "MIDDLEGEN", "middlegen3", "MILYN", "Milyn", "MINGLYN", "Minglyn", "MOCKINJECT", "MockInject", "MODFORJ", "Mod4j: Modeling for Java using Domain Specific Languages", "MODELLO", "Modello", "MWEBLOGIC", "Mojo\'s Maven plugin for WebLogic", "MSITESKIN", "Mojo\'s SiteSkinner Maven Plugin", "MTRUEZIP", "Mojo\'s TrueZIP Maven Plugin", "MULTIVERSE", "Multiverse", "MVEL", "MVEL", "MVFLEX", "MVFLEX", "MYTIMES", "myTimes", "NANOIOC", "NanoContainer IoC", "NANOWAR", "NanoContainer NanoWar", "NANOPERSISTENCE", "NanoContainer Persistence", "NANOREMOTING", "NanoContainer Remoting", "NANOSANDBOX", "NanoContainer Sandbox", "NANOTOOLS", "NanoContainer Tools", "NEO", "Neo", "NEST", "NEST", "OAUTHSS", "OAuth for Spring Security", "OORT", "oort", "OPENEMPI", "Open Source Master Patient Index", "OPENEJB", "OpenEJB", "OPENIM", "OpenIM", "OPENPIPELINE", "OpenPipeline", "OPENTCDB", "OpenTCDB", "OPENXMA", "openXMA", "OXFJORD", "oxfjord", "PARANAMER", "Paranamer", "PASSERELLE", "Passerelle", "PERFFORJ", "Perf4J", "PERPETUUM", "Perpetuum", "PHYSIOME", "Physiome", "PICOBOOK", "PicoContainer Book", "PICOPLUGINS", "PicoContainer Plugins", "PICOUNIT", "PicoUnit", "PININ", "Pinin", "PLJ", "PL-J", "PLATYPUS", "platypus", "PLXASRVR", "Plexus Application Server", "POLYMAP", "POLYMAP", "PREON", "Preon", "PROM", "Prometheus", "PROPHIT", "Prophit", "PTOYS", "ProxyToys", "PUZZLEGIS", "Puzzle GIS", "QDOX", "QDox", "QIXWEB", "qixweb", "QUAERE", "Quaere", "REDBACK", "Redback", "RUBYRULES", "Ruby Rules", "RVM", "RVM", "SVNA", "Savana", "SCRUMTIME", "Scrum Time", "SENRO", "Senro", "SERVICECONDUIT", "Service Conduit", "SERVICESTUDIO", "ServiceStudio", "SETPOINT", "SetPoint", "SHOCKS", "Shocks", "SIMJP", "Simple Java Profiler", "SSSO", "Simple SSO", "SXC", "Simple XML Compiler", "SIPO", "sippedout", "SOT", "Soter", "SPICE", "Spice", "SQUIGGLE", "Squiggle", "STAX", "StAX", "STAXMATE", "StaxMate", "STOMP", "Stomp", "SVNJ", "SVN4J", "SWIBY", "Swiby ", "SWIZZLE", "Swizzle", "SYMMETRICDS", "SymmetricDS", "TEST", "test", "TESTORIENTED", "Test-Oriented Development and Debugging", "TESTDOX", "TestDox", "TIX", "Timeindexing", "TIMTAM", "TimTam", "TRAILS", "Trails", "TQL", "TranQL", "TYNAMO", "Tynamo", "UISPEC", "UISpec4J", "UMP", "Unix Maven Plugin", "WADI", "WADI", "WAFFLE", "Waffle", "WERKFLOW", "werkflow", "WERKZ", "werkz", "WSTX", "Woodstox", "XTENLANG", "X10", "XB", "XBean", "XDASJ", "xdas4j", "XFIRE", "XFire", "XHARNESS", "XHarness", "XJB", "XJB", "XLITE", "Xlite", "XEVPP", "XML Events Verbatim Pull-Push", "XSITE", "XSite", "XULUX", "xulux", "XWIRE", "XWire", "YAGLL", "Yagll", "YAN", "Yan", "YFACES", "YFaces", "YUMAFRAMEWORK", "yuma framework", "ZONEINFOTZ", "Zoneinfo TimeZone"); 


triggers query => qr/^(.*\s)*($Apache_JIRA_keys)\-([\d]{1,})\s*(.*)$|^(.*\s)*($Codehaus_JIRA_keys)\-([\d]{1,})\s*(.*)$/i;

handle query => sub {

    my $apacheKey = $2 || '';
    my $codehausKey = $6 || '';
    
    my $apacheTicketID = $3 || '';
    my $codehausTicketID = $7 || '';

    my $html_return = '';
 
	  # Dealing with the case where two projects on different bugtrackers have the same project key
    if ($apacheKey){
        my $uKey = uc $apacheKey;
        my $apacheTicket = $uKey . "-" . $apacheTicketID;
        my $apacheProject = $Apache_JIRA_projects{$uKey}; 
        $html_return .= qq($apacheProject (Apache JIRA Bugtracker): see ticket <a href="https://issues.apache.org/jira/browse/$apacheTicket">$apacheTicket</a>.);
        $html_return .= '<br>' if $codehausKey;
    }

    if ($codehausKey){
        my $uKey = uc $codehausKey;
        my $codehausTicket = uc $uKey . "-" . $codehausTicketID;
        my $codehausProject = $Codehaus_JIRA_projects{$uKey}; 

        $html_return .= qq($codehausProject (Codehaus JIRA Bugtracker): see ticket <a href="https://jira.codehaus.org/browse/$codehausTicket">$codehausTicket</a>.) if $codehausTicket;
    }

    return undef, html => $html_return if $html_return;
};

1;
