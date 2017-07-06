--LIVEBOS_SQL_END_WITH自动语句终止符号
--LIVEBOS_SQL_END_WITH=/
prompt
prompt Creating table ADDRESSCATEGORY
prompt ==============================
prompt
create table ADDRESSCATEGORY
(
  CATEGORY VARCHAR2(50) not null,
  NOTE     VARCHAR2(50),
  EMAIL    VARCHAR2(50) not null
)
/


prompt
prompt Creating table LBAUTH
prompt =====================
prompt
create table LBAUTH
(
  ID	     NUMBER(12) not null,
  TYPE       INTEGER not null,
  MEMBERID   INTEGER not null,
  TABLENAME  VARCHAR2(256) not null,
  OPERATE    NUMBER(19),
  CUSTOMOPER VARCHAR2(256),
  AUDITFLAG  INTEGER not null,
  AUTHDATE   DATE not null,
  AuthUser   int 
)
/
alter table LBAUTH
  add constraint PK_LBAUTH primary key (ID)
/

prompt
prompt Creating table LBAUTHSCOPE
prompt ==========================
prompt
create table LBAUTHSCOPE
(
  ID	     NUMBER(12) not null,
  TYPE       INTEGER not null,
  MEMBERID   INTEGER not null,
  AUTHFLAG   INTEGER not null,
  TABLENAME  VARCHAR2(256) not null,
  OPERATE    NUMBER(19),
  CUSTOMOPER VARCHAR2(256),
  AUDITFLAG  INTEGER not null,
  AUTHDATE   DATE not null ,
  AuthUser   int 
)
/
alter table LBAUTHSCOPE
  add constraint PK_LBAUTHSCOPE primary key (ID)
/

prompt
prompt Creating table LBBIZPROCESSDEFS
prompt ===============================
prompt
create table LBBIZPROCESSDEFS
(
  ID         NUMBER(12) not null,
  NAME       VARCHAR2(256) not null,
  DEFINITION CLOB,
  DESCRIBE   VARCHAR2(256),
  ATTRIBUTE  INTEGER,
  NOTE       VARCHAR2(1024),
  Type	     INTEGER
)
/
alter table LBBIZPROCESSDEFS
  add constraint LBBIZPROCESSDEFS_PK primary key (ID)
/

prompt
prompt Creating table LBBIZFUNCTIONDEFS
prompt ===============================
prompt
CREATE  TABLE lbBizFunctionDefs
( 
  ID		number(16, 0) NOT NULL ,
  Name		VARCHAR2(256) NOT NULL ,
  Definition	clob,
  Describe	varchar2(256),
  Attribute	int,
  Note		varchar2(1024),
  PackagePath   varchar2(512),
  bizType	int not null
)
/
alter table LBBIZFUNCTIONDEFS
  add constraint LBBIZFUNCTIONDEFS_PK primary key (ID)
/


prompt
prompt Creating table LBBULLETIN
prompt ===============================
prompt
CREATE TABLE lbBulletin (
  ID		numeric(12, 0) NOT NULL ,
  BeginDate	date NULL ,
  EndDate	date NOT NULL ,
  PublicTime	date default sysdate ,
  Receiver	varchar (1024)  NULL ,
  Scope		numeric(12, 0) NULL ,
  Title		varchar (1024)  NOT NULL ,
  Content	varchar (3000)  NULL ,
  Priority	numeric(12, 0) NULL ,
  Topic		numeric(12, 0) NOT NULL 
) 
/
alter table LBBULLETIN
  add constraint LBBULLETIN_PK primary key (ID)
/

prompt
prompt Creating table LBDATASCOPEAUTH
prompt ==============================
prompt
create table LBDATASCOPEAUTH
(
  ID	    NUMBER(12) not null,
  TYPE      INTEGER not null,
  MEMBERID  INTEGER not null,
  SCOPENAME VARCHAR2(60) not null,
  SCOPEEXP  VARCHAR2(1024),
  AUDITFLAG INTEGER not null,
  AUTHDATE  DATE not null,
  ATTRIBUTE INTEGER,
  AUTHUSER  INTEGER
)
/
comment on column LBDATASCOPEAUTH.TYPE
  is '0|用户/1|角色/'
/
comment on column LBDATASCOPEAUTH.SCOPEEXP
  is '<ALL>代表全部记录,其他数据代表记录ID'
/
comment on column LBDATASCOPEAUTH.AUDITFLAG
  is '0|未审核/1|已审核'
/
alter table LBDATASCOPEAUTH
  add constraint PK_LBDATASCOPEAUTH primary key (ID)
/

prompt
prompt Creating table LBDEVELOPLOG
prompt ===========================
prompt
create table LBDEVELOPLOG
(
  ID             NUMBER(12) not null,
  OBJECTNAME     VARCHAR2(30),
  OBJECTDESCRIBE VARCHAR2(30),
  OBJECTTYPE     VARCHAR2(30),
  CREATOR        VARCHAR2(30),
  CREATETIME     VARCHAR2(30),
  MODIFIER       VARCHAR2(30),
  MODIFYTIME     VARCHAR2(30),
  VERSION        VARCHAR2(30),
  COMMITTIME     VARCHAR2(30),
  FINISHTIME     VARCHAR2(30),
  COMMITUSERID   NUMBER(22),
  COMMITIP       VARCHAR2(30),
  TEAMTYPE       VARCHAR2(30),
  TEAMVERSION    VARCHAR2(30),
  OBJECTFILE     VARCHAR2(256),
  OPERATENAME    VARCHAR2(30),
  OPERATETYPE    VARCHAR2(30)
)
/
alter table LBDEVELOPLOG
  add constraint PK_LBDEVELOPLOG primary key (ID)
/

prompt
prompt Creating table LBGROUP
prompt ======================
prompt
create table LBGROUP
(
  ID	   NUMBER(12) not null,
  GRPCODE  VARCHAR2(30) not null,
  NAME     VARCHAR2(100) not null,
  CATEGORY NUMBER(12) not null
)
/
alter table LBGROUP
  add constraint PK_LBGROUP primary key (ID)
/

prompt
prompt Creating table LBGROUPMEMBER
prompt ============================
prompt
create table LBGROUPMEMBER
(
  ID	   NUMBER(12) not null,
  USERID   INTEGER not null,
  GROUPID  INTEGER not null,
  MODIDATE DATE not null
)
/
alter table LBGROUPMEMBER
  add constraint PK_LBGROUPMEMBER primary key (ID)
/

prompt
prompt Creating table LBHISTORYBIZPROCESSDEFS
prompt ======================================
prompt
create table LBHISTORYBIZPROCESSDEFS
(
  ID         NUMBER(12) not null,
  NAME       VARCHAR2(256) not null,
  VERSION    INTEGER not null,
  DEFINITION CLOB,
  DESCRIBE   VARCHAR2(256),
  ATTRIBUTE  INTEGER,
  NOTE       VARCHAR2(1024)
)
/
alter table LBHISTORYBIZPROCESSDEFS
  add constraint LBHISTORYBIZPROCESSDEFS_PK primary key (ID)
/

prompt
prompt Creating table LBHISTORYMESSAGE
prompt ===============================
prompt
create table LBHISTORYMESSAGE
(
  ID       NUMBER(12) not null,
  SENDER   NUMBER(12),
  TIME     DATE,
  CONTENT  VARCHAR2(3000),
  RECEIVER NUMBER(12),
  TITLE    VARCHAR2(1024),
  REFOBJ   VARCHAR2(1024)
)
/
alter table LBHISTORYMESSAGE
  add constraint LBHISTORYMESSAGE_PK primary key (ID)
/

prompt
prompt Creating table LBHISTORYWORKOWNERPARAM
prompt ======================================
prompt
create table LBHISTORYWORKOWNERPARAM
(
  ID       NUMBER(12) not null,
  WF_NAME  VARCHAR2(300),
  VERSION  NUMBER(12),
  NAME     VARCHAR2(30),
  DESCRIBE VARCHAR2(300),
  VALUE    VARCHAR2(300)
)
/
alter table LBHISTORYWORKOWNERPARAM
  add constraint LBHISTORYWORKOWNERPARAM_PK primary key (ID)
/

prompt
prompt Creating table LBHISTORYWORKVARIABLE
prompt ====================================
prompt
create table LBHISTORYWORKVARIABLE
(
  ID       NUMBER(12) not null,
  WF_NAME  VARCHAR2(300),
  VERSION  NUMBER(12),
  NAME     VARCHAR2(30),
  DESCRIBE VARCHAR2(300),
  VALUE    VARCHAR2(300),
  VARSCOPE INTEGER,
  VARTYPE  VARCHAR2(30)
)
/
alter table LBHISTORYWORKVARIABLE
  add constraint LBHISTORYWORKVARIABLE_PK primary key (ID)
/

prompt
prompt Creating table lbKMAuth
prompt ====================================
prompt
create table lbKMAuth  (
   ID            NUMERIC(16,0),
   Directory     NUMERIC(12,0),
   Type 	 NUMERIC(12,0),
   RID           NUMERIC(12,0),
   Permission    INT
)
/
alter table lbKMAuth
  add constraint lbKMAuth_PK primary key (ID)
/

prompt
prompt Creating table lbKMCommentRating
prompt ====================================
prompt
create table lbKMCommentRating  (
   ID             NUMERIC(16,0),
   CID            INT,
   UserID         NUMERIC(12,0),
   Rating         SMALLINT
)
/
alter table lbKMCommentRating
  add constraint lbKMCommentRating_PK primary key (ID)
/

prompt
prompt Creating table lbKMDirectory
prompt ====================================
prompt
create table lbKMDirectory  (
   ID             NUMERIC(16,0),
   FID            NUMERIC(12,0),
   Grade          NUMERIC(4,0),
   Type           NUMERIC(12,0),
   Name           VARCHAR2(200),
   FDNCode        VARCHAR2(300)
)
/
alter table lbKMDirectory
  add constraint lbKMDirectory_PK primary key (ID)
/

prompt
prompt Creating table lbKMUserContribute
prompt ====================================
prompt
create table lbKMUserContribute  (
   ID             NUMERIC(16,0),
   UserID         NUMERIC(12,0),
   TopicCount     INT,
   Visits         INT,
   Comments       INT,
   Rating         NUMERIC(1,2),
   Effort         FLOAT
)
/
alter table lbKMUserContribute
  add constraint lbKMUserContribute_PK primary key (ID)
/

prompt
prompt Creating table lbKMUserFavorite
prompt ====================================
prompt
create table lbKMUserFavorite  (
   ID             NUMERIC(16,0),
   UserID         NUMERIC(12,0),
   KID            INT,
   Category       VARCHAR2(256)
)
/
alter table lbKMUserFavorite
  add constraint lbKMUserFavorite_PK primary key (ID)
/

prompt
prompt Creating table lbKMUserFollow
prompt ====================================
prompt
create table lbKMUserFollow  (
   ID             NUMERIC(16,0),
   UserID         NUMERIC(12,0),
   Condition      VARCHAR2(1024)
)
/
alter table lbKMUserFollow
  add constraint lbKMUserFollow_PK primary key (ID)
/

prompt
prompt Creating table lbKnowledge
prompt ====================================
prompt
create table lbKnowledge  (
   ID             NUMERIC(16,0)       not null,
   Title          VARCHAR2(512)       not null,
   Content        CLOB,
   Directory      NUMERIC(12,0)       not null,
   Document       VARCHAR2(2048),
   Actor          NUMERIC(12,0)       not null,
   CreateTime     DATE                not null,
   UpdateActor    NUMERIC(12,0),
   UpdateTime     DATE,
   Score          NUMERIC(12,0),
   Visits         NUMERIC(12,0)
)
/
alter table lbKnowledge
  add constraint lbKnowledge_PK primary key (ID)
/

prompt
prompt Creating table lbKnowledgeComment
prompt ====================================
prompt
create table lbKnowledgeComment  (
   ID                   NUMERIC(16,0)      not null,
   KID                  INT                not null,
   CommentActor         NUMERIC(12,0)      not null,
   CommentContent       VARCHAR2(1024)     not null,
   CommentTime          DATE               not null,
   Score                NUMERIC(12,0)
)
/
alter table lbKnowledgeComment
  add constraint lbKnowledgeComment_PK primary key (ID)
/


prompt
prompt Creating table lbKnowledgeProperties
prompt ====================================
prompt
create table lbKnowledgeProperties  (
   ID                   NUMERIC(16,0)       not null,
   KID                  INT                 not null,
   Property             VARCHAR2(256)       not null,
   Value                VARCHAR2(1024)
)
/
alter table lbKnowledgeProperties
  add constraint lbKnowledgeProperties_PK primary key (ID)
/


prompt
prompt Creating table lbKnowledgeRate
prompt ====================================
prompt
create table lbKnowledgeRate  (
   ID                   NUMERIC(16,0),
   KID                  INT,
   UserID               NUMERIC(12,0),
   Rating               SMALLINT,
   Time                 DATE
)
/
alter table lbKnowledgeRate
  add constraint lbKnowledgeRate_PK primary key (ID)
/


prompt
prompt Creating table LBMAIL
prompt ====================================
prompt
create table LBMAIL (
  ID		INTEGER NOT NULL ,
  UserID	VARCHAR2(100) NOT NULL,
  Folder	INTEGER NOT NULL ,
  "UID"		VARCHAR2(100) ,
  Flag		INTEGER NULL ,
  FromUser	VARCHAR2(300) ,
  ToUser	VARCHAR2(3000) ,
  CC		VARCHAR2(3000) ,
  BCC		VARCHAR2(3000) ,
  Subject	VARCHAR2(300) ,
  Content	VARCHAR2(3000) ,
  Attachment	VARCHAR2(2048) ,
  SentDate	DATE NULL ,
  Type		VARCHAR2(300) ,
  MailAccount	VARCHAR2(300) 
)
/
alter table LBMAIL
  add constraint PK_LBMAIL primary key (ID)
/

prompt
prompt Creating table LBMAILFOLDER
prompt ====================================
prompt
CREATE TABLE LBMAILFOLDER (
  ID		INTEGER NOT NULL ,
  Name		VARCHAR2(100) NOT NULL,
  Describe	VARCHAR2(300) NOT NULL,
  UserID	VARCHAR2(100) NOT NULL,
  Sort		INTEGER NULL ,
  MailAccount	VARCHAR2(300) 
) 
/
alter table LBMAILFOLDER
  add constraint PK_LBMAILFOLDER primary key (ID)
/

prompt
prompt Creating table LBMANAGESCOPE
prompt ============================
prompt
create table LBMANAGESCOPE
(
  ID	     NUMBER(12) not null,
  TYPE       INTEGER not null,
  MEMBERID   INTEGER not null,
  MANAGETYPE INTEGER not null,
  MANAGEID   INTEGER not null,
  AUDITFLAG  INTEGER not null,
  AUTHDATE   DATE not null,
  AuthUser   INTEGER null 
)
/
alter table LBMANAGESCOPE
  add constraint PK_LBMANAGESCOPE primary key (ID)
/

prompt
prompt Creating table LBMEMBER
prompt =======================
prompt
create table LBMEMBER
(
  ID	   NUMBER(12) not null,
  USERID   INTEGER not null,
  ROLEID   INTEGER not null,
  ORGID    INTEGER not null,
  MODIDATE DATE not null,
  AUDITFLAG NUMBER(12),
  AUTHUSER  INTEGER,
  AUTHDATE  DATE
)
/
alter table LBMEMBER
  add constraint PK_LBMEMBER primary key (ID)
/

prompt
prompt Creating table LBMENUPORTLET
prompt ============================
prompt
create table LBMENUPORTLET
(
  ID           NUMBER(12) not null,
  CATEGORY     NUMBER(12),
  TITLE        VARCHAR2(256),
  URL          VARCHAR2(1024),
  ATTRIBUTE    NUMBER(12),
  THUMBPICTURE VARCHAR2(256),
  LISTPICTURE  VARCHAR2(256),
  TYPE         NUMBER(12)
)
/
alter table LBMENUPORTLET
  add primary key (ID)
/

prompt
prompt Creating table LBMENUPORTLETCATEGORY
prompt ====================================
prompt
create table LBMENUPORTLETCATEGORY
(
  ID       NUMBER(12) not null,
  CATEGORY VARCHAR2(30)
)
/
alter table LBMENUPORTLETCATEGORY
  add primary key (ID)
/

prompt
prompt Creating table LBMETACOLUMN
prompt ===========================
prompt
create table LBMETACOLUMN
(
  ID          NUMBER(12) not null,
  NAME        VARCHAR2(120) not null,
  TYPE        NUMBER(10),
  LENGTH      NUMBER(10),
  CONTROL     NUMBER(10),
  DESCRIBE    VARCHAR2(256),
  PRIMARYKEY  NUMBER(10),
  SCALE       NUMBER(10),
  OPTIONITEM  VARCHAR2(2048),
  REFTABLE    VARCHAR2(120),
  REFNAME     VARCHAR2(120),
  DEFVALUE    VARCHAR2(256),
  DATATYPE    NUMBER(10),
  DIRECTION   NUMBER(10,0),
  ATTRIBUTE   NUMBER(10,0),
  EXPRESSION  VARCHAR2(2048),
  CATEGORY    VARCHAR2(100),
  EVENTSOURCE NUMBER(10,0),
  NOTE        VARCHAR2(512)
)
/
alter table LBMETACOLUMN
  add primary key (ID)
/

prompt
prompt Creating table LBMETACOLUMNVALIDATOR
prompt ====================================
prompt
create table LBMETACOLUMNVALIDATOR
(
  ID         NUMBER(12) not null,
  COLUMNNAME VARCHAR2(200),
  VALIDATOR  VARCHAR2(200),
  EXPRESSION VARCHAR2(1024),
  MESSAGE    VARCHAR2(1024),
  ATTRIBUTE  NUMBER(10,0)
)
/
alter table LBMETACOLUMNVALIDATOR
  add constraint LBMETACOLUMNVALIDATOR_PK primary key (ID)
/

prompt
prompt Creating table LBOBJECTDEFS
prompt ===========================
prompt
create table LBOBJECTDEFS
(
  ID         NUMBER(12) not null,
  TABLENAME  VARCHAR2(256) not null,
  TYPE       INTEGER,
  DEFINITION CLOB,
  ObjectDescribe varchar2(128)
)
/
alter table LBOBJECTDEFS
  add constraint LBOBJECTDEFS_PK primary key (ID)
/

prompt
prompt Creating table LBORGANIZATION
prompt =============================
prompt
create table LBORGANIZATION
(
  ID	   NUMBER(12) not null,
  FID      NUMBER(12) not null,
  GRADE    NUMBER(12) not null,
  TYPE     NUMBER(12) not null,
  ORGTYPE  NUMBER(12) not null,
  ORGCODE  VARCHAR2(30) not null,
  NAME     VARCHAR2(200) not null,
  DESCRIBE VARCHAR2(1024),
  FDNCODE  VARCHAR2(300) not null
)
/
alter table LBORGANIZATION
  add constraint PK_LBORGANIZATION primary key (ID)
/

prompt
prompt Creating table LBPORTLETDEFINE
prompt =============================
prompt
create table lbPortletDefine (
  portletName	varchar2(50)	 NOT NULL ,
  portletDescribe  varchar2(60)  NOT NULL ,
  category	varchar2(60)	 NOT NULL ,
  type		int		 NOT NULL ,
  definition	clob		 NOT NULL ,
  PRIMARY KEY (portletName)
)
/

prompt
prompt Creating table LBREPORTFILE
prompt ===========================
prompt
create table LBREPORTFILE
(
  ID         NUMBER(16) not null,
  OWNER      NUMBER(12,0),
  SUBJECT    VARCHAR2(300) not null,
  DOCUMENT   VARCHAR2(256),
  CREATEDATE DATE,
  MODIFYDATE DATE
)
/
alter table LBREPORTFILE
  add constraint PK_LBREPORTFILE primary key (ID)
/

prompt
prompt Creating table LBREPORTPUBLISHSCHEDULE
prompt ======================================
prompt
create table LBREPORTPUBLISHSCHEDULE
(
  ID             NUMBER(12,0) not null,
  REPORTNAME     VARCHAR2(200),
  EXPORTTYPE     VARCHAR2(10) not null,
  SUBJECT        VARCHAR2(300) not null,
  RUNTIME        CHAR(10) not null,
  PERIODICITY    NUMBER(12,0) not null,
  DAYOPTION      NUMBER(12,0) not null,
  DAYINTERVAL    NUMBER(3) not null,
  DAYSTART       DATE not null,
  WEEKINTERVAL   NUMBER(2),
  WEEKLIMIT      VARCHAR2(50),
  MONTHOPTION    NUMBER(12) not null,
  MONTHDAY       NUMBER(2) not null,
  MONTHWEEK1     NUMBER(12),
  MONTHWEEK2     NUMBER(12) not null,
  MONTHLIMIT     VARCHAR2(50),
  ONCEDAYSTART   DATE,
  SUBSCRIBEEMAIL VARCHAR2(2000),
  SUBSCRIBEUSER  VARCHAR2(1024),
  SUBSCRIBEOWNER NUMBER(12),
  PARAMETER      VARCHAR2(2000)
)
/
alter table LBREPORTPUBLISHSCHEDULE
  add constraint PK_LBREPORTPUBLISHSCHEDULE primary key (ID)
/

prompt
prompt Creating table LBREPORTSETTING
prompt ======================================
prompt
create table lbReportSetting
(
  ID              NUMBER(16) not null,
  SettingType     VARCHAR2(30),
  DisplayCount    NUMBER(12),
  DisplayRowCount NUMBER(12),
  Position        VARCHAR2(30),
  Owner           NUMBER(12),
  constraint PK_LBREPORTSETTING primary key (ID)
)
/

prompt
prompt Creating table LBREPORTUSAGE
prompt ======================================
prompt
create table lbReportUsage
(
  ID         NUMBER(12) not null,
  ReportName VARCHAR2(50),
  Owner      NUMBER(20),
  CreateDate DATE,
  constraint PK_LBREPORTUSAGE primary key (ID)
)
/

prompt
prompt Creating table LBREPORTFAVORITE
prompt ======================================
prompt
create table lbReportFavorite
(
  ID         NUMBER(12) not null,
  ReportName VARCHAR2(300),
  Subject    VARCHAR2(300),
  Owner      NUMBER(12),
  CreateDate DATE,
  constraint PK_LBREPORTFAVORITE primary key (ID)
)
/

prompt
prompt Creating table LBREPORTSUBSCRIBE
prompt ======================================
prompt
create table lbReportSubscribe
(
  ID           NUMBER(16) not null,
  ReportName   VARCHAR2(200),
  ExportType   VARCHAR2(10),
  Subject      VARCHAR2(300),
  RunTime      CHAR(10) not null,
  Periodicity  NUMBER(12),
  DayStart     DATE,
  DayOption    NUMBER(12),
  DayInterval  NUMBER(3),
  WeekInterval NUMBER(2),
  WeekLimit    VARCHAR2(300),
  MonthOption  NUMBER(12),
  MonthDay     NUMBER(2),
  MonthWeek1   NUMBER(12),
  MonthWeek2   NUMBER(12),
  MonthLimit   VARCHAR2(300),
  OnceDayStart DATE,
  Owner        NUMBER(16),
  Parameter    VARCHAR2(2000),
  constraint PK_LBREPORTSUBSCRIBE primary key (ID)
)
/

prompt
prompt Creating table LBROLE
prompt =====================
prompt
create table LBROLE
(
  ID	   NUMBER(12) not null,
  TYPE     NUMBER(12) not null,
  NAME     VARCHAR2(100) not null,
  CATEGORY INTEGER not null,
  ROLECODE VARCHAR2(30) not null,
  ORGID    INTEGER
)
/
alter table LBROLE
  add constraint PK_LBROLE primary key (ID)
/

prompt
prompt Creating table LBROLECATEGORY
prompt =============================
prompt
create table LBROLECATEGORY
(
  ID	       NUMBER(12) not null,
  TYPE         NUMBER(12) not null,
  CATEGORYNAME VARCHAR2(60) not null
)
/
alter table LBROLECATEGORY
  add constraint PK_LBROLECATEGORY primary key (ID)
/

prompt
prompt Creating table LBSCOPEFACTOR
prompt ============================
prompt
create table LBSCOPEFACTOR
(
  ID	      NUMBER(16) not null,
  SCOPENAME   VARCHAR2(60) not null,
  SCOPETYPE   INTEGER,
  SCOPEFACTOR VARCHAR2(256) not null,
  DESCRIBE    VARCHAR2(300),
  REMARK      VARCHAR2(128)
)
/
comment on column LBSCOPEFACTOR.SCOPETYPE
  is '0|对象/1|系统代码/2|表达式(暂时不用)'
/
alter table LBSCOPEFACTOR
  add constraint PK_LBSCOPEFACTOR primary key (ID)
/

prompt
prompt Creating table LBSCOPEPERMISSION
prompt ================================
prompt
create table LBSCOPEPERMISSION
(
  ID	     NUMBER(12) not null,
  TABLENAME  VARCHAR2(256),
  COLUMNNAME VARCHAR2(100),
  OPERATOR   VARCHAR2(256),
  SCOPENAME  VARCHAR2(60)
)
/
alter table LBSCOPEPERMISSION
  add constraint PK_LBSCOPEPERMISSION primary key (ID)
/

prompt
prompt Creating table LBSESSIONLOCKTICKET
prompt ================================
prompt
create table lbSessionLockTicket  
(
   ID                   NUMBER(9),
   "UID"                NUMBER(12),
   CreationTime         DATE,
   Password             CHAR(32)
)
/
alter table LBSESSIONLOCKTICKET
  add constraint PK_LBSESSIONLOCKTICKET primary key (ID)
/
create sequence S_LBSESSIONLOCKTICKET
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20
/

prompt
prompt Creating table lbSearchIndexEx
prompt ==========================
prompt
create table lbSearchIndexEx
(
  id         varchar2(65) not null,
  objectName varchar2(32),
  objectID   varchar2(32),
  type       varchar2(5),
  scheme     varchar2(32),
  translate  char(1),
  method     varchar2(32),
  expression varchar2(32),
  repeat     number
)
/
alter table LBSEARCHINDEXEX
  add constraint PK_LBSEARCHINDEXEX primary key (ID)
/
comment on column lbSearchIndexEx.id
  is '索引ID'
/
comment on column lbSearchIndexEx.objectName
  is '对象名称'
/
comment on column lbSearchIndexEx.objectID
  is '对象ID'
/
comment on column lbSearchIndexEx.type
  is '操作类型'
/
comment on column lbSearchIndexEx.scheme
  is '对象所在方案名'
/
comment on column lbSearchIndexEx.translate
  is '是否转换文档'
/
comment on column lbSearchIndexEx.method
  is '操作方法'
/
comment on column lbSearchIndexEx.expression
  is '表达式'
/
comment on column lbSearchIndexEx.repeat
  is '重复次数'
/

prompt
prompt Creating table LBSURROGATE
prompt ==========================
prompt
create table LBSURROGATE
(
  ID	      NUMBER(12) not null,
  CONSTITUENT INTEGER not null,
  SURROGATE   INTEGER not null,
  STARTDATE   DATE not null,
  ENDDATE     DATE not null,
  STATUS      INTEGER not null
)
/
alter table LBSURROGATE
  add constraint PK_LBSURROGATE primary key (ID)
/

prompt
prompt Creating table LBSURROGATETRUST
prompt ===============================
prompt
create table LBSURROGATETRUST
(
  ID   NUMBER(12) not null,
  SID  INTEGER not null,
  TYPE INTEGER not null,
  NAME VARCHAR2(256) not null
)
/
alter table LBSURROGATETRUST
  add constraint PK_LBSURROGATETRUST primary key (ID)
/
alter table LBSURROGATETRUST
  add constraint FK_SURROG foreign key (SID)
  references LBSURROGATE (ID)
/

prompt
prompt Creating table LBSYSVARIABLE
prompt ============================
prompt
create table LBSYSVARIABLE
(
  ID	       NUMBER(12) not null,
  NAME         VARCHAR2(60),
  DESCRIBE     VARCHAR2(300),
  SCOPE        INTEGER,
  INITEXP      VARCHAR2(1024),
  CURRENTVALUE VARCHAR2(1024),
  FLAG         INTEGER
)
/
alter table LBSYSVARIABLE
  add constraint PK_LBSYSVARIABLE primary key (ID)
/

create table lbStudioSource (
  sourceContent		blob,
  objectName		varchar2(100)	NOT NULL,
  symbolicName		varchar2(100)	NOT NULL,
  bundleVersion		varchar2(20)	NOT NULL,
  PRIMARY KEY (objectName)
)
/

prompt
prompt Creating table LBWORKOWNERPARAM
prompt ===============================
prompt
create table LBWORKOWNERPARAM
(
  ID       NUMBER(12) not null,
  WF_NAME  VARCHAR2(300),
  NAME     VARCHAR2(30),
  DESCRIBE VARCHAR2(300),
  VALUE    VARCHAR2(300)
)
/
alter table LBWORKOWNERPARAM
  add constraint LBWORKOWNERPARAM_PK primary key (ID)
/

prompt
prompt Creating table LBWORKVARIABLE
prompt =============================
prompt
create table LBWORKVARIABLE
(
  ID       NUMBER(12) not null,
  WF_NAME  VARCHAR2(300),
  NAME     VARCHAR2(30),
  DESCRIBE VARCHAR2(300),
  VALUE    VARCHAR2(300),
  VARSCOPE INTEGER,
  VARTYPE VARCHAR2(30)
)
/
alter table LBWORKVARIABLE
  add constraint LBWORKVARIABLE_PK primary key (ID)
/

prompt
prompt Creating table OS_CURRENTSTEP
prompt =============================
prompt
create table OS_CURRENTSTEP
(
  ID		NUMBER(10) not null,
  ENTRY_ID	NUMBER(10),
  STEP_ID	INTEGER,
  ACTION_ID	INTEGER,
  OWNER		VARCHAR2(200),
  START_DATE	DATE,
  FINISH_DATE	DATE,
  DUE_DATE	DATE,
  STATUS	VARCHAR2(200),
  CALLER	VARCHAR2(20),
  SUMMARY	VARCHAR2(1024),
  CONSIGNER	VARCHAR2(20),
  FLAG		INTEGER
)
/

prompt
prompt Creating table OS_CURRENTSTEP_PREV
prompt ==================================
prompt
create table OS_CURRENTSTEP_PREV
(
  ID          NUMBER(10) not null,
  PREVIOUS_ID NUMBER(10) not null
)
/

prompt
prompt Creating table OS_HISTORYSTEP
prompt =============================
prompt
create table OS_HISTORYSTEP
(
  ID		NUMBER(10) not null,
  ENTRY_ID	NUMBER(10),
  STEP_ID	INTEGER,
  ACTION_ID	INTEGER,
  OWNER		VARCHAR2(200),
  START_DATE	DATE,
  FINISH_DATE	DATE,
  DUE_DATE	DATE,
  STATUS	VARCHAR2(200),
  CALLER	VARCHAR2(20),
  SUMMARY	VARCHAR2(1024),
  CONSIGNER	VARCHAR2(20),
  FLAG		INTEGER
)
/

prompt
prompt Creating table OS_HISTORYSTEP_PREV
prompt ==================================
prompt
create table OS_HISTORYSTEP_PREV
(
  ID          NUMBER(10) not null,
  PREVIOUS_ID NUMBER(10) not null
)
/

prompt
prompt Creating table OS_HISTORYWORKFLOWDEFS
prompt =====================================
prompt
create table OS_HISTORYWORKFLOWDEFS
(
  WF_NAME       VARCHAR2(256) not null,
  WF_VERSION    INTEGER not null,
  WF_DEFINITION CLOB,
  WF_DESCRIBE   VARCHAR2(256),
  WF_LAYOUT     CLOB
)
/


prompt
prompt Creating table OS_PROPERTYENTRY
prompt ===============================
prompt
create table OS_PROPERTYENTRY
(
  GLOBAL_KEY   VARCHAR2(255) not null,
  ITEM_KEY     VARCHAR2(255) not null,
  ITEM_TYPE    NUMBER(5),
  STRING_VALUE VARCHAR2(1000),
  DATE_VALUE   DATE,
  DATA_VALUE   RAW(2000),
  FLOAT_VALUE  FLOAT,
  NUMBER_VALUE NUMBER(18)
)
/

prompt
prompt Creating table OS_WFENTRY
prompt =========================
prompt
create table OS_WFENTRY
(
  ID        NUMBER(10) not null,
  NAME      VARCHAR2(128),
  STATE     NUMBER(5),
  INITIATOR VARCHAR2(120),
  INIT_DATE DATE,
  SUBJECT   VARCHAR2(1024)
)
/

prompt
prompt Creating table OS_WORKFLOWDEFS
prompt ==============================
prompt
create table OS_WORKFLOWDEFS
(
  WF_NAME       VARCHAR2(256) not null,
  WF_DEFINITION CLOB,
  WF_DESCRIBE   VARCHAR2(256),
  WF_LAYOUT     CLOB,
  CATEGORY      varchar2(200),
  ATTRIBUTE     int,
  TYPE		INTEGER
)
/
alter table OS_PROPERTYENTRY add  constraint OS_PROPERTYENTRY_PK primary key (GLOBAL_KEY, ITEM_KEY)
/
alter table OS_WFENTRY add  constraint OS_WFENTRY_PK primary key (ID)
/

alter table OS_CURRENTSTEP add constraint OS_CURRENTSTEP_PK primary key (ID)
/
alter table OS_CURRENTSTEP add  constraint OS_CURRENTSTEP_FK1 foreign key (ENTRY_ID) references OS_WFENTRY(ID)
/

alter table OS_HISTORYSTEP add  constraint OS_HISTORYSTEP_PK primary key (ID)
/
alter table OS_HISTORYSTEP add  constraint OS_HISTORYSTEP_FK1 foreign key (ENTRY_ID) references OS_WFENTRY(ID)
/ 
alter table OS_CURRENTSTEP_PREV add constraint OS_CURRENTSTEP_PREV_PK primary key (ID, PREVIOUS_ID)
/
alter table OS_CURRENTSTEP_PREV add constraint OS_CURRENTSTEP_PREV_FK1 foreign key (ID) references OS_CURRENTSTEP(ID)
/
alter table OS_CURRENTSTEP_PREV add constraint OS_CURRENTSTEP_PREV_FK2 foreign key (PREVIOUS_ID) references OS_HISTORYSTEP(ID)
/

alter table OS_HISTORYSTEP_PREV add  constraint OS_HISTORYSTEP_PREV_PK primary key (ID, PREVIOUS_ID)
/
alter table OS_HISTORYSTEP_PREV add  constraint OS_HISTORYSTEP_PREV_FK1 foreign key (ID) references OS_HISTORYSTEP(ID)
/
alter table OS_HISTORYSTEP_PREV add  constraint OS_HISTORYSTEP_PREV_FK2 foreign key (PREVIOUS_ID) references OS_HISTORYSTEP(ID)
/



alter table OS_WORKFLOWDEFS add constraint OS_WORKFLOWDEFS_PK primary key (WF_NAME)
/

alter table OS_HISTORYWORKFLOWDEFS add constraint OS_HISTORYWORKFLOWDEFS_PK primary key (WF_NAME,WF_VERSION)
/

prompt
prompt Creating table QRTZ_JOB_DETAILS
prompt ===============================
prompt
create table QRTZ_JOB_DETAILS
(
  JOB_NAME          VARCHAR2(80) not null,
  JOB_GROUP         VARCHAR2(80) not null,
  DESCRIPTION       VARCHAR2(120),
  JOB_CLASS_NAME    VARCHAR2(128) not null,
  IS_DURABLE        VARCHAR2(1) not null,
  IS_VOLATILE       VARCHAR2(1) not null,
  IS_STATEFUL       VARCHAR2(1) not null,
  REQUESTS_RECOVERY VARCHAR2(1) not null,
  JOB_DATA          BLOB
)
/
alter table QRTZ_JOB_DETAILS
  add primary key (JOB_NAME, JOB_GROUP)
/
create index IDX_QRTZ_J_REQ_RECOVERY on QRTZ_JOB_DETAILS (REQUESTS_RECOVERY)
/

prompt
prompt Creating table QRTZ_TRIGGERS
prompt ============================
prompt
create table QRTZ_TRIGGERS
(
  TRIGGER_NAME   VARCHAR2(80) not null,
  TRIGGER_GROUP  VARCHAR2(80) not null,
  JOB_NAME       VARCHAR2(80) not null,
  JOB_GROUP      VARCHAR2(80) not null,
  IS_VOLATILE    VARCHAR2(1) not null,
  DESCRIPTION    VARCHAR2(120),
  NEXT_FIRE_TIME NUMBER(13),
  PREV_FIRE_TIME NUMBER(13),
  TRIGGER_STATE  VARCHAR2(16) not null,
  TRIGGER_TYPE   VARCHAR2(8) not null,
  START_TIME     NUMBER(13) not null,
  END_TIME       NUMBER(13),
  CALENDAR_NAME  VARCHAR2(80),
  MISFIRE_INSTR  NUMBER(2),
  JOB_DATA       BLOB,
  PRIORITY       NUMBER(13) null
)
/
alter table QRTZ_TRIGGERS
  add primary key (TRIGGER_NAME, TRIGGER_GROUP)
/
alter table QRTZ_TRIGGERS
  add foreign key (JOB_NAME, JOB_GROUP)
  references QRTZ_JOB_DETAILS (JOB_NAME, JOB_GROUP)
/
create index IDX_QRTZ_T_NEXT_FIRE_TIME on QRTZ_TRIGGERS (NEXT_FIRE_TIME)
/
create index IDX_QRTZ_T_NFT_ST on QRTZ_TRIGGERS (NEXT_FIRE_TIME, TRIGGER_STATE)
/
create index IDX_QRTZ_T_STATE on QRTZ_TRIGGERS (TRIGGER_STATE)
/
create index IDX_QRTZ_T_VOLATILE on QRTZ_TRIGGERS (IS_VOLATILE)
/

prompt
prompt Creating table QRTZ_BLOB_TRIGGERS
prompt =================================
prompt
create table QRTZ_BLOB_TRIGGERS
(
  TRIGGER_NAME  VARCHAR2(80) not null,
  TRIGGER_GROUP VARCHAR2(80) not null,
  BLOB_DATA     BLOB
)
/
alter table QRTZ_BLOB_TRIGGERS
  add primary key (TRIGGER_NAME, TRIGGER_GROUP)
/
alter table QRTZ_BLOB_TRIGGERS
  add foreign key (TRIGGER_NAME, TRIGGER_GROUP)
  references QRTZ_TRIGGERS (TRIGGER_NAME, TRIGGER_GROUP)
/

prompt
prompt Creating table QRTZ_CALENDARS
prompt =============================
prompt
create table QRTZ_CALENDARS
(
  CALENDAR_NAME VARCHAR2(80) not null,
  CALENDAR      BLOB not null
)
/
alter table QRTZ_CALENDARS
  add primary key (CALENDAR_NAME)
/

prompt
prompt Creating table QRTZ_CRON_TRIGGERS
prompt =================================
prompt
create table QRTZ_CRON_TRIGGERS
(
  TRIGGER_NAME    VARCHAR2(80) not null,
  TRIGGER_GROUP   VARCHAR2(80) not null,
  CRON_EXPRESSION VARCHAR2(80) not null,
  TIME_ZONE_ID    VARCHAR2(80)
)
/
alter table QRTZ_CRON_TRIGGERS
  add primary key (TRIGGER_NAME, TRIGGER_GROUP)
/
alter table QRTZ_CRON_TRIGGERS
  add foreign key (TRIGGER_NAME, TRIGGER_GROUP)
  references QRTZ_TRIGGERS (TRIGGER_NAME, TRIGGER_GROUP)
/

prompt
prompt Creating table QRTZ_FIRED_TRIGGERS
prompt ==================================
prompt
create table QRTZ_FIRED_TRIGGERS
(
  ENTRY_ID          VARCHAR2(95) not null,
  TRIGGER_NAME      VARCHAR2(80) not null,
  TRIGGER_GROUP     VARCHAR2(80) not null,
  IS_VOLATILE       VARCHAR2(1) not null,
  INSTANCE_NAME     VARCHAR2(80) not null,
  FIRED_TIME        NUMBER(13) not null,
  STATE             VARCHAR2(16) not null,
  JOB_NAME          VARCHAR2(80),
  JOB_GROUP         VARCHAR2(80),
  IS_STATEFUL       VARCHAR2(1),
  REQUESTS_RECOVERY VARCHAR2(1),
  PRIORITY          NUMBER(13) NOT NULL
)
/
alter table QRTZ_FIRED_TRIGGERS
  add primary key (ENTRY_ID)
/
create index IDX_QRTZ_FT_JOB_GROUP on QRTZ_FIRED_TRIGGERS (JOB_GROUP)
/
create index IDX_QRTZ_FT_JOB_NAME on QRTZ_FIRED_TRIGGERS (JOB_NAME)
/
create index IDX_QRTZ_FT_JOB_REQ_RECOVERY on QRTZ_FIRED_TRIGGERS (REQUESTS_RECOVERY)
/
create index IDX_QRTZ_FT_JOB_STATEFUL on QRTZ_FIRED_TRIGGERS (IS_STATEFUL)
/
create index IDX_QRTZ_FT_TRIG_GROUP on QRTZ_FIRED_TRIGGERS (TRIGGER_GROUP)
/
create index IDX_QRTZ_FT_TRIG_INST_NAME on QRTZ_FIRED_TRIGGERS (INSTANCE_NAME)
/
create index IDX_QRTZ_FT_TRIG_NAME on QRTZ_FIRED_TRIGGERS (TRIGGER_NAME)
/
create index IDX_QRTZ_FT_TRIG_NM_GP on QRTZ_FIRED_TRIGGERS (TRIGGER_NAME, TRIGGER_GROUP)
/
create index IDX_QRTZ_FT_TRIG_VOLATILE on QRTZ_FIRED_TRIGGERS (IS_VOLATILE)
/

prompt
prompt Creating table QRTZ_JOB_LISTENERS
prompt =================================
prompt
create table QRTZ_JOB_LISTENERS
(
  JOB_NAME     VARCHAR2(80) not null,
  JOB_GROUP    VARCHAR2(80) not null,
  JOB_LISTENER VARCHAR2(80) not null
)
/
alter table QRTZ_JOB_LISTENERS
  add primary key (JOB_NAME, JOB_GROUP, JOB_LISTENER)
/
alter table QRTZ_JOB_LISTENERS
  add foreign key (JOB_NAME, JOB_GROUP)
  references QRTZ_JOB_DETAILS (JOB_NAME, JOB_GROUP)
/

prompt
prompt Creating table QRTZ_LOCKS
prompt =========================
prompt
create table QRTZ_LOCKS
(
  LOCK_NAME VARCHAR2(40) not null
)
/
alter table QRTZ_LOCKS
  add primary key (LOCK_NAME)
/

prompt
prompt Creating table QRTZ_PAUSED_TRIGGER_GRPS
prompt =======================================
prompt
create table QRTZ_PAUSED_TRIGGER_GRPS
(
  TRIGGER_GROUP VARCHAR2(80) not null
)
/
alter table QRTZ_PAUSED_TRIGGER_GRPS
  add primary key (TRIGGER_GROUP)
/

prompt
prompt Creating table QRTZ_SCHEDULER_STATE
prompt ===================================
prompt
create table QRTZ_SCHEDULER_STATE
(
  INSTANCE_NAME     VARCHAR2(80) not null,
  LAST_CHECKIN_TIME NUMBER(13) not null,
  CHECKIN_INTERVAL  NUMBER(13) not null,
  RECOVERER         VARCHAR2(80)
)
/
alter table QRTZ_SCHEDULER_STATE
  add primary key (INSTANCE_NAME)
/

prompt
prompt Creating table QRTZ_SIMPLE_TRIGGERS
prompt ===================================
prompt
create table QRTZ_SIMPLE_TRIGGERS
(
  TRIGGER_NAME    VARCHAR2(80) not null,
  TRIGGER_GROUP   VARCHAR2(80) not null,
  REPEAT_COUNT    NUMBER(7) not null,
  REPEAT_INTERVAL NUMBER(12) not null,
  TIMES_TRIGGERED NUMBER(7) not null
)
/
alter table QRTZ_SIMPLE_TRIGGERS
  add primary key (TRIGGER_NAME, TRIGGER_GROUP)
/
alter table QRTZ_SIMPLE_TRIGGERS
  add foreign key (TRIGGER_NAME, TRIGGER_GROUP)
  references QRTZ_TRIGGERS (TRIGGER_NAME, TRIGGER_GROUP)
/

prompt
prompt Creating table QRTZ_TRIGGER_LISTENERS
prompt =====================================
prompt
create table QRTZ_TRIGGER_LISTENERS
(
  TRIGGER_NAME     VARCHAR2(80) not null,
  TRIGGER_GROUP    VARCHAR2(80) not null,
  TRIGGER_LISTENER VARCHAR2(80) not null
)
/
alter table QRTZ_TRIGGER_LISTENERS
  add primary key (TRIGGER_NAME, TRIGGER_GROUP, TRIGGER_LISTENER)
/
alter table QRTZ_TRIGGER_LISTENERS
  add foreign key (TRIGGER_NAME, TRIGGER_GROUP)
  references QRTZ_TRIGGERS (TRIGGER_NAME, TRIGGER_GROUP)
/

prompt
prompt Creating table TAUTH
prompt ====================
prompt
create table TAUTH
(
  USERID     VARCHAR2(16) not null,
  TABLENAME  VARCHAR2(256) not null,
  OPERATE    NUMBER(9),
  TYPE       NUMBER(5),
  CUSTOMOPER VARCHAR2(256)
)
/

prompt
prompt Creating table TAUTHAREA
prompt ========================
prompt
create table TAUTHAREA
(
  ID         NUMBER(12) not null,
  AUTHID     NUMBER(18) not null,
  AUTHAREAID NUMBER(18) not null,
  TYPE       NUMBER(18) not null
)
/

prompt
prompt Creating table TBLOG
prompt ====================
prompt
create table TBLOG
(
  ID              NUMBER(12) not null,
  TITLE           VARCHAR2(200),
  CONTENT         CLOB,
  CATEGORY        NUMBER,
  PUBTIME         DATE,
  "UID"           NUMBER,
  VISITS          NUMBER(4),
  COMMENTS        NUMBER(4),
  SCOPE           NUMBER(12),
  ATTACHMENT      BLOB,
  PICTURE1        BLOB,
  PICTURE2        BLOB,
  TYPE            NUMBER(12),
  LASTCOMMENTTIME DATE,
  Stick INTEGER,
  ReC INTEGER,
  Pick INTEGER
)
/
alter table TBLOG
  add primary key (ID)
/

prompt
prompt Creating table TBLOGCOMMENT
prompt ===========================
prompt
create table TBLOGCOMMENT
(
  ID          NUMBER(12),
  "UID"       NUMBER(12),
  "COMMENT"   VARCHAR2(4000),
  BLOGID      NUMBER(12),
  COMMENTTIME DATE
)
/

prompt
prompt Creating table LBNEWSCLASS
prompt ===========================
prompt
create table LBNEWSCLASS
(
  ID 		 NUMBER(16) NOT NULL,
  ClassName 	 VARCHAR2 (200),	
  ClassOrder	 NUMBER(12) NULL,
  IsShowHome 	 INTEGER NULL,
  IsAnonymous 	 INTEGER NULL,
  IsComment 	 INTEGER NULL,
  IsAnonymousComment  INTEGER NULL,	
  PRIMARY KEY (ID)
)
/

prompt
prompt Creating table LBNEWSATTACHMENT
prompt ===========================
prompt
create table LBNEWSATTACHMENT
(
  ID		NUMBER(16) NOT NULL ,
  tBlog_ID 	NUMBER(16) NOT NULL ,
  Title 	VARCHAR2 (300),
  Document 	VARCHAR2 (300) NULL ,
  Memo 	VARCHAR2 (300) ,
  PRIMARY KEY (ID)
)
/

prompt
prompt Creating table TCALENDAR
prompt ========================
prompt
create table TCALENDAR
(
  ID      NUMBER(12) not null,
  RQ      NUMBER(8) not null,
  YEAR    NUMBER(4) not null,
  MONTH   NUMBER(2) not null,
  DAY     NUMBER(2) not null,
  QUARTER NUMBER(1) not null,
  WEEK    NUMBER(2) not null,
  NoOfWeek NUMBER(1) null,
  Type	  NUMBER(12) null
)
/

prompt
prompt Creating table TCATEGORYINFO
prompt ============================
prompt
create table TCATEGORYINFO
(
  ID          NUMBER(18) not null,
  PID         NUMBER(18) not null,
  CATEGORY    VARCHAR2(50) not null,
  TYPE        NUMBER(18) not null,
  PACKAGEPATH VARCHAR2(512),
  REMARK      VARCHAR2(512),
  ParentPath  varchar2(1024)
)
/

prompt
prompt Creating table TCMDDEF
prompt ======================
prompt
create table TCMDDEF
(
  NO           NUMBER(10) not null,
  NAME         VARCHAR2(200),
  CMDNAME      VARCHAR2(200),
  CMDTYPE      NUMBER(10),
  TABLENAME    VARCHAR2(200),
  CONDITION    VARCHAR2(2048),
  RESTRICTTYPE NUMBER(10),
  RESTRICTEXP  VARCHAR2(512),
  DESCRIBE     VARCHAR2(60)
)
/

prompt
prompt Creating table TCMDOPER
prompt =======================
prompt
create table TCMDOPER
(
  NO         NUMBER(10) not null,
  CMDNAME    VARCHAR2(200),
  NAME       VARCHAR2(200),
  FIELDNAME  VARCHAR2(200),
  EXPRESSION VARCHAR2(1024)
)
/

prompt
prompt Creating table TCMDRESTRICT
prompt ===========================
prompt
create table TCMDRESTRICT
(
  NO         NUMBER(10) not null,
  CMDNAME    VARCHAR2(120) not null,
  NAME       VARCHAR2(120),
  TYPE       NUMBER(10),
  EXPRESSION VARCHAR2(1024),
  TABLENAME  VARCHAR2(120),
  CONDITION  VARCHAR2(1023),
  PROMPT     VARCHAR2(1024),
  DESCRIBE   VARCHAR2(50)
)
/

prompt
prompt Creating table TCMDVALIDATE
prompt ===========================
prompt
create table TCMDVALIDATE
(
  NO         NUMBER(10) not null,
  CMDNAME    VARCHAR2(120) not null,
  NAME       VARCHAR2(120),
  TYPE       NUMBER(10),
  EXPRESSION VARCHAR2(1024),
  TABLENAME  VARCHAR2(120),
  CONDITION  VARCHAR2(1023),
  PROMPT     VARCHAR2(1024),
  DESCRIBE   VARCHAR2(50)
)
/

prompt
prompt Creating table TCUSTOMSERIAL
prompt ============================
prompt
create table TCUSTOMSERIAL
(
  NAME VARCHAR2(50) not null,
  ID   NUMBER(10) not null
)
/

prompt
prompt Creating table TCUSTUMOPERATE
prompt =============================
prompt
create table TCUSTUMOPERATE
(
  NO            NUMBER(18) not null,
  TABLENAME     VARCHAR2(50) not null,
  OPTNAME       VARCHAR2(50) not null,
  DESCRIBE      VARCHAR2(50) not null,
  TYPE          NUMBER(10) not null,
  DEFAULTCTR    NUMBER(10),
  VIEWATTRIBUTE NUMBER(10),
  Tip 		varchar2(512),
  IconCls 	varchar2(60)
)
/

prompt
prompt Creating table TFIELDDIC
prompt ========================
prompt
create table TFIELDDIC
(
  DICID      NUMBER(10),
  PARNAME    VARCHAR2(60),
  NAME       VARCHAR2(120),
  REMARK     VARCHAR2(100),
  TYPE       NUMBER(10),
  LENGTH     NUMBER(10),
  CONTROL    NUMBER(10),
  DESCRIBE   VARCHAR2(256),
  PRIMARYKEY NUMBER(10),
  SCALE      NUMBER(10),
  OPTIONITEM VARCHAR2(2048),
  REFTABLE   VARCHAR2(120),
  REFNAME    VARCHAR2(120),
  DEFVALUE   VARCHAR2(256),
  DATATYPE   NUMBER(10),
  DIRECTION  VARCHAR2(50),
  ATTRIBUTE  NUMBER(10),
  EXPRESSION VARCHAR2(1024)
)
/

prompt
prompt Creating table TFIELDMAP
prompt ========================
prompt
create table TFIELDMAP
(
  NO        NUMBER(10) not null,
  TABLENAME VARCHAR2(256),
  FIELDNAME VARCHAR2(256),
  SRCFIELD  VARCHAR2(256),
  TYPE      NUMBER(10)
)
/

prompt
prompt Creating table TFIELDVALIDATOR
prompt ==============================
prompt
create table TFIELDVALIDATOR
(
  ID         NUMBER(10) not null,
  TABLENAME  VARCHAR2(200),
  COLUMNNAME VARCHAR2(200),
  VALIDATOR  VARCHAR2(200),
  EXPRESSION VARCHAR2(1024),
  MESSAGE    VARCHAR2(1024),
  ATTRIBUTE  NUMBER(10)
)
/
prompt
prompt Creating table TIDSERIAL
prompt ========================
prompt
create table TIDSERIAL
(
  NAME VARCHAR2(200) not null,
  ID   NUMBER(9)
)
/

prompt
prompt Creating table TLIMITPARAMMAP
prompt =============================
prompt
create table TLIMITPARAMMAP
(
  NO          NUMBER(10) not null,
  TABLENAME   VARCHAR2(250) not null,
  COLUMNNAME  VARCHAR2(250) not null,
  PARAMTABLE  VARCHAR2(250) not null,
  PARAMNAME   VARCHAR2(250) not null,
  LIMITCOLUMN VARCHAR2(250)
)
/

prompt
prompt Creating table TLIVEBOSSTUDIOINFO
prompt =================================
prompt
create table TLIVEBOSSTUDIOINFO
(
  OBJECTNAME VARCHAR2(50),
  VERSION    VARCHAR2(20),
  CREATEDATE VARCHAR2(20),
  MODIFYDATE VARCHAR2(20)
)
/

prompt
prompt Creating table TMENU
prompt ====================
prompt
create table TMENU
(
  ID        NUMBER(9),
  FID       NUMBER(9),
  TABLENAME VARCHAR2(256),
  TITLE     VARCHAR2(256),
  "LEVEL"   NUMBER(9),
  DESCRIBE  VARCHAR2(200),
  OBJTYPE   NUMBER(10),
  WINTYPE   NUMBER(10),
  ATTRIBUTE NUMBER(10),
  HELPURL   VARCHAR2(50),
  CUSTOMURL VARCHAR2(128),
  ICON      VARCHAR2(128)
)
/

prompt
prompt Creating table TMESREFOBJ
prompt =========================
prompt
create table TMESREFOBJ
(
  ID        NUMBER(18) not null,
  TABLENAME VARCHAR2(50) not null,
  DESCRIBE  VARCHAR2(50),
  CATEGORY  VARCHAR2(50) not null,
  TYPE      NUMBER(10) not null,
  SRCTAB    VARCHAR2(50)
)
/

prompt
prompt Creating table TMESSAGE
prompt =======================
prompt
create table TMESSAGE
(
  ID       NUMBER(18) not null,
  MESSAGE  VARCHAR2(1024) not null,
  DATETIME DATE not null,
  SENDER   VARCHAR2(50) not null,
  TITLE    VARCHAR2(50) not null
)
/

prompt
prompt Creating table TOBJMODE
prompt =======================
prompt
create table TOBJMODE
(
  ID        NUMBER(12) not null,
  TABLENAME VARCHAR2(120),
  TYPE      NUMBER(12),
  VALUE     varchar2(512)
)
/

prompt
prompt Creating table TOPERATEAUDIT
prompt ============================
prompt
create table TOPERATEAUDIT
(
  ID        NUMBER(12) not null,
  "UID"     NUMBER(12),
  TIME      DATE,
  OPERATE   NUMBER(12),
  CONTENT   VARCHAR2(1024),
  IP        VARCHAR2(30),
  OBJECT    VARCHAR2(120),
  OBJECTID  NUMBER(12),
  GENOBJECT VARCHAR2(2048),
  NOTE      VARCHAR2(120)
)
/

prompt
prompt Creating table TOPERLOG
prompt =======================
prompt
create table TOPERLOG
(
  ID      NUMBER(12) not null,
  "UID"   NUMBER(12),
  OPTIME  DATE,
  CONTENT VARCHAR2(300),
  IP      VARCHAR2(30),
  NOTE    VARCHAR2(120),
  ObjectInfo VARCHAR2(30),
  Operate VARCHAR2(30),
  ParamInfo VARCHAR2(1024)
)
/

prompt
prompt Creating table TOUTOBJ
prompt ======================
prompt
create table TOUTOBJ
(
  ID        NUMBER(18) 	not null,
  OUTURL    VARCHAR2(1024) not null,
  TABLENAME VARCHAR2(50)
)
/

prompt
prompt Creating table TQUERYCONDITION
prompt ==============================
prompt
create table TQUERYCONDITION
(
  QUERYNAME VARCHAR2(256),
  CONDITION VARCHAR2(2048)
)
/

prompt
prompt Creating table TQUERYFIELD
prompt ==========================
prompt
create table TQUERYFIELD
(
  NO         NUMBER(10) not null,
  QUERYNAME  VARCHAR2(256),
  NAME       VARCHAR2(256),
  DESCRIBE   VARCHAR2(1024),
  EXPRESSION VARCHAR2(1024),
  TYPE       NUMBER(10)
)
/

prompt
prompt Creating table TQUERYGROUP
prompt ==========================
prompt
create table TQUERYGROUP
(
  NO        NUMBER(10) not null,
  QUERYNAME VARCHAR2(250),
  FIELD     VARCHAR2(250),
  DESCRIBE  VARCHAR2(1024)
)
/

prompt
prompt Creating table TQUERYLINK
prompt =========================
prompt
create table TQUERYLINK
(
  NO        NUMBER(10) not null,
  QUERYNAME VARCHAR2(250),
  LTABLE    VARCHAR2(250),
  LFIELD    VARCHAR2(250),
  JOINTYPE  NUMBER(10),
  RTABLE    VARCHAR2(250),
  RFIELD    VARCHAR2(250)
)
/

prompt
prompt Creating table TQUERYORDER
prompt ==========================
prompt
create table TQUERYORDER
(
  NO        NUMBER(10) not null,
  QUERYNAME VARCHAR2(250),
  FIELD     VARCHAR2(250),
  DIRECTION NUMBER(10),
  TYPE      NUMBER(10),
  DESCRIBE  VARCHAR2(1024)
)
/

prompt
prompt Creating table TQUERYREF
prompt ========================
prompt
create table TQUERYREF
(
  NO        NUMBER(10) 	not null,
  QUERYNAME VARCHAR2(250),
  TABLENAME VARCHAR2(250),
  DESCRIBE  VARCHAR2(1024)
)
/

prompt
prompt Creating table TRECEIVERMES
prompt ===========================
prompt
create table TRECEIVERMES
(
  ID       NUMBER(18) 	not null,
  RECEIVER VARCHAR2(25) not null,
  STATE    NUMBER(10) 	not null,
  READTIME DATE,
  "LEVEL"  NUMBER(10),
  MESGID   NUMBER(18) 	not null,
  SLAVE    VARCHAR2(1024)
)
/

prompt
prompt Creating table TRELATIONOBJ
prompt ===========================
prompt
create table TRELATIONOBJ
(
  NO           NUMBER(12) 	not null,
  TABLENAME    VARCHAR2(120),
  RELATIONNAME VARCHAR2(120),
  DESCRIBE     VARCHAR2(256),
  TYPE         NUMBER(10),
  RELATIONID   VARCHAR2(60),
  UIMode       VARCHAR2(200),
  RESTRICTEXP VARCHAR2(1024)
)
/

prompt
prompt Creating table TROLE
prompt ====================
prompt
create table TROLE
(
  ID     NUMBER(12) 	not null,
  ROLEID VARCHAR2(30) 	not null,
  NAME   VARCHAR2(200),
  NOTE   VARCHAR2(300)
)
/

prompt
prompt Creating table TSCHEDULE
prompt ========================
prompt
create table TSCHEDULE
(
  ID                 NUMBER(12) 	not null,
  SCHEDULEID         NUMBER(14),
  TITLE              VARCHAR2(300),
  LOCATION           VARCHAR2(100),
  BEGINDATE          DATE,
  BEGINTIME          NUMBER(12),
  ENDDATE            DATE,
  ENDTIME            NUMBER(12),
  CONTENT            VARCHAR2(3000),
  URGENCY            NUMBER(12),
  CATEGORY           NUMBER(12),
  SCOPE              NUMBER(12),
  NEEDREMINDER       NUMBER(12),
  REMINDERCHANNEL    VARCHAR2(30),
  REMINDERTIME       NUMBER(12),
  REMINDERTIMES      NUMBER(12),
  REMINDERTIMEPERIOD NUMBER(12),
  REMINDERCIRCLE     NUMBER(12),
  RECURRENCE         NUMBER(12),
  RECURENCECOUNT     NUMBER(3),
  RECURENCEENDDATE   DATE,
  CREATOR            NUMBER(12),
  PARTICIPART        VARCHAR2(2048),
  Repeat             varchar2(50),
  RepeatPeriod       NUMBER(12),
  RepeatEndDate      Date,
  Color		     varchar2(30)
)
/
alter table TSCHEDULE
  add primary key (ID)
/

prompt
prompt Creating table TSCHEDULEAUDIT
prompt =============================
prompt
create table TSCHEDULEAUDIT
(
  ID           NUMBER(12) not null,
  PARTICIPATOR NUMBER(12),
  OWNER        NUMBER(12),
  AUDITFLAG    NUMBER(1),
  SCHEDULEID   NUMBER(12),
  OPERATE      NUMBER(12)
)
/
alter table TSCHEDULEAUDIT
  add primary key (ID)
/

prompt
prompt Creating table TSCHEDULEDEF
prompt ===========================
prompt
create table TSCHEDULEDEF
(
  ID       NUMBER(12) 	not null,
  CREATOR  NUMBER(12),
  NAME     VARCHAR2(256),
  DESCRIBE VARCHAR2(2048),
  TYPE     NUMBER(1),
  OWNER    NUMBER(12),
  COLOR    VARCHAR2(30)
)
/
alter table TSCHEDULEDEF
  add primary key (ID)
/

prompt
prompt Creating table TSEQUENCE
prompt ========================
prompt
create table TSEQUENCE
(
  NAME VARCHAR2(50)	not null,
  ID   NUMBER(10) 	not null,
  RANGE_NO  NUMBER(12),
  RANGE_SIZE NUMBER(12)
)
/

CREATE TABLE tScheduleOption 
(
  ID 		numeric(12,0) 	NOT NULL ,
  UserID 	numeric(12,0) 	NOT NULL,
  primary key  (ID)
)
/

CREATE TABLE tScheduleParticipator 
(
  ID		numeric(16,0) NOT NULL ,
  tSchedule_ID	numeric(12,0) NULL ,
  ShareObject	varchar2(2048) NULL ,
  SharePower	numeric(12,0) NULL ,
  primary key  (ID)
) 
/

CREATE TABLE lbScheduleRefObj
(
  ID 		numeric(12, 0) 	NOT NULL,
  RefTable 	varchar (256) ,
  Name 		varchar (256) ,
  RefColumn 	varchar (256),
  primary key  (ID)
)
/

CREATE TABLE lbScheduleViewOption
(
  ID 			numeric(12, 0) 	NOT NULL ,
  scheduleDef 		numeric(12, 0) 	NULL ,
  tScheduleOption_ID 	numeric(12, 0) 	NULL ,
  Visible 		numeric(2, 0) 	NULL ,
  primary key  (ID)
)
/

CREATE TABLE lbScheduleRefOption
(
  ID 			numeric(12, 0) 	NOT NULL ,
  scheduleRefDef 	numeric(12, 0) 	NULL ,
  tScheduleOption_ID 	numeric(12, 0) 	NULL ,
  Visible 		numeric(2, 0) 	NULL ,
  primary key  (ID)
)
/

prompt
prompt Creating table TSYSPARAM
prompt ========================
prompt
create table TSYSPARAM
(
  ID         NUMBER(12) 	not null,
  PARAMNAME  VARCHAR2(100) 	not null,
  PARAMNOTE  VARCHAR2(512) 	not null,
  ISEDIT     NUMBER(10),
  PARAMVALUE VARCHAR2(512) 	not null,
  FLAG       VARCHAR2(5)
)
/

prompt
prompt Creating table TTABLE
prompt =====================
prompt
create table TTABLE
(
  TABLENAME   VARCHAR2(120),
  DESCRIBE    VARCHAR2(256),
  CATEGORY    VARCHAR2(256),
  TYPE        NUMBER(5),
  SRCTAB      VARCHAR2(120),
  ATTRIBUTE   NUMBER(10),
  TEMPLET     VARCHAR2(120),
  TABLEID     VARCHAR2(50),
  REMARK      VARCHAR2(2048),
  MODIFYDATE  VARCHAR2(20),
  MODIFIER    VARCHAR2(20),
  CREATOR     VARCHAR2(20),
  CREATEDATE  VARCHAR2(20),
  VERSION     VARCHAR2(10),
  FLAG        INTEGER,
  PACKAGEPATH VARCHAR2(512),
  DATASOURCENAME VARCHAR2(32) 
)
/

prompt
prompt Creating table TTABLEHISTORY
prompt ============================
prompt
create table TTABLEHISTORY
(
  NO         NUMBER(16) not null,
  TABLENAME  VARCHAR2(120),
  DESCRIBE   VARCHAR2(256),
  CATEGORY   VARCHAR2(256),
  TYPE       NUMBER(4),
  SRCTAB     VARCHAR2(120),
  ATTRIBUTE  NUMBER(10),
  TEMPLET    VARCHAR2(120),
  VERSION    VARCHAR2(20),
  DESIGNER   VARCHAR2(20),
  DESIGNTIME DATE,
  REMARK     VARCHAR2(2048)
)
/

prompt
prompt Creating table TTABLEOBJ
prompt ========================
prompt
create table TTABLEOBJ
(
  NO           NUMBER(16) 	not null,
  TABLENAME    VARCHAR2(120) 	not null,
  NAME         VARCHAR2(120) 	not null,
  TYPE         NUMBER(10),
  LENGTH       NUMBER(10),
  CONTROL      NUMBER(10),
  DESCRIBE     VARCHAR2(256),
  PRIMARYKEY   NUMBER(10),
  SCALE        NUMBER(10),
  OPTIONITEM   VARCHAR2(2048),
  REFTABLE     VARCHAR2(500),
  REFNAME      VARCHAR2(120),
  DEFVALUE     VARCHAR2(256),
  DATATYPE     NUMBER(10),
  DIRECTION    NUMBER(10),
  ATTRIBUTE    NUMBER(10),
  EXPRESSION   VARCHAR2(2048),
  CATEGORY     VARCHAR2(100),
  EVENTSOURCE  NUMBER(10),
  NOTE         VARCHAR2(512),
  CHECKTYPE    INTEGER,
  METACOLUMN   VARCHAR2(32),
  INVISIBLEEXP VARCHAR2(1024),
  DISABLEEXP   VARCHAR2(1024),
  StateBit     INTEGER,
  Properties   VARCHAR2(2000),
  BizType	int
)
/

prompt
prompt Creating table TTABLEOBJHISTORY
prompt ===============================
prompt
create table TTABLEOBJHISTORY
(
  NO           NUMBER(16) 	not null,
  TABLENAME    VARCHAR2(120) 	not null,
  NAME         VARCHAR2(120) 	not null,
  VERSION      VARCHAR2(120) 	not null,
  TYPE         NUMBER(10),
  LENGTH       NUMBER(10),
  CONTROL      NUMBER(10),
  DESCRIBE     VARCHAR2(256),
  PRIMARYKEY   NUMBER(10),
  SCALE        NUMBER(10),
  OPTIONITEM   VARCHAR2(2048),
  REFTABLE     VARCHAR2(120),
  REFNAME      VARCHAR2(120),
  DEFVALUE     VARCHAR2(256),
  DATATYPE     NUMBER(10),
  DIRECTION    NUMBER(10),
  ATTRIBUTE    NUMBER(10),
  EXPRESSION   VARCHAR2(1024),
  CATEGORY     VARCHAR2(100),
  NOTE         VARCHAR2(512),
  INVISIBLEEXP VARCHAR2(1024),
  DISABLEEXP   VARCHAR2(1024)
)
/

prompt
prompt Creating table TTRANS
prompt =====================
prompt
create table TTRANS
(
  ID         NUMBER(12) not null,
  TABLENAME  VARCHAR2(50) not null,
  TRANSNAME  VARCHAR2(2048) not null,
  RESULT     NUMBER(10),
  SCALE      NUMBER(10),
  SQLTYPE    NUMBER(10),
  RESULTTYPE NUMBER(10),
  SOURCENAME VARCHAR2(200)
)
/

prompt
prompt Creating table TUSER
prompt ====================
prompt
create table TUSER
(
  ID          NUMBER(12) not null,
  USERID      VARCHAR2(50) not null,
  PASSWORD    VARCHAR2(32),
  NAME        VARCHAR2(30),
  GRADE       NUMBER(12),
  LASTLOGIN   DATE,
  LOGINS      NUMBER(12),
  CHGPWDTIME  DATE,
  CHGPWDLIMIT NUMBER(12),
  STATUS      NUMBER(12),
  IPLIMIT     VARCHAR2(20),
  CERTNO      VARCHAR2(60),
  ORGID	      NUMBER(10),
  PHOTO	      BLOB,
  LockTime    DATE
)
/

CREATE TABLE tUserPreferences (
  ID 		NUMBER(12) 	NOT NULL ,
  UserID	VARCHAR2(50) 	NOT NULL ,
  Type		NUMBER(16) 	NULL ,
  KeyStr 	VARCHAR2(128) 	NOT NULL ,
  Value 	VARCHAR2(512) 	NOT NULL ,
  Note 	VARCHAR2(512)  	NULL, 
  CONSTRAINT PK_tUserPreferences PRIMARY KEY (ID)
)
/

prompt
prompt Creating table TVIEWCONDITION
prompt =============================
prompt
create table TVIEWCONDITION
(
  TABLENAME 	VARCHAR2(256),
  CONDITION 	VARCHAR2(2048),
  TYPE      	INTEGER,
  FORMULA   	VARCHAR2(2048)
)
/

prompt
prompt Creating table TVIEWOBJ
prompt =======================
prompt
create table TVIEWOBJ
(
  NO           NUMBER(12) not null,
  VIEWNAME     VARCHAR2(256),
  NAME         VARCHAR2(256),
  TYPE         NUMBER(5),
  CONTROL      NUMBER(4),
  DESCRIBE     VARCHAR2(256),
  VALUE        VARCHAR2(256),
  OPTIONITEM   VARCHAR2(1024),
  REFTABLE     VARCHAR2(500),
  REFNAME      VARCHAR2(256),
  DISPLAY      NUMBER(4),
  DATATYPE     NUMBER(10),
  DIRECTION    NUMBER(10),
  ATTRIBUTE    NUMBER(10),
  ORGDESC      VARCHAR2(256),
  CATEGORY     VARCHAR2(100),
  OPERATOR     NUMBER(10),
  NOTE         VARCHAR2(512),
  METACOLUMN   VARCHAR2(32),
  INVISIBLEEXP VARCHAR2(1024),
  DISABLEEXP   VARCHAR2(1024),
  DEFVALUE     VARCHAR2(256),
  StateBit     int,
  Properties   varchar2(2000)
)
/

prompt
prompt Creating table TVIEWOBJHISTORY
prompt ==============================
prompt
create table TVIEWOBJHISTORY
(
  NO           NUMBER(12) not null,
  VIEWNAME     VARCHAR2(256),
  VERSION      VARCHAR2(20),
  NAME         VARCHAR2(256),
  TYPE         NUMBER(4),
  CONTROL      NUMBER(4),
  DESCRIBE     VARCHAR2(256),
  VALUE        VARCHAR2(256),
  OPTIONITEM   VARCHAR2(1024),
  REFTABLE     VARCHAR2(120),
  REFNAME      VARCHAR2(256),
  DISPLAY      NUMBER(4),
  DATATYPE     NUMBER(10),
  DIRECTION    NUMBER(10),
  ATTRIBUTE    NUMBER(10),
  ORGDESC      VARCHAR2(256),
  CATEGORY     VARCHAR2(50),
  OPERATOR     NUMBER(10),
  NOTE         VARCHAR2(512),
  DEFVALUE     VARCHAR2(256),
  INVISIBLEEXP VARCHAR2(1024),
  DISABLEEXP   VARCHAR2(1024)
)
/

prompt
prompt Creating table TXTDM
prompt ====================
prompt
create table TXTDM
(
  FLDM VARCHAR2(30) not null,
  FLMC VARCHAR2(30) not null,
  IBM  NUMBER(9),
  CBM  VARCHAR2(12) not null,
  NOTE VARCHAR2(50) not null,
  FLAG INTEGER,
  TYPE INTEGER,
  CATEGORY VARCHAR2(80)
)
/

prompt
prompt Creating table WF_INITIATOR
prompt ===========================
prompt
create table WF_INITIATOR
(
  ID		NUMBER(10)	not null,
  ENTRY_ID	NUMBER(10),
  INITIATOR	VARCHAR2(20),
  INIT_DATE	DATE
)
/

prompt
prompt Creating sequence SEQ_OS_CURRENTSTEPS
prompt =====================================
prompt
create sequence SEQ_OS_CURRENTSTEPS
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20
/

prompt
prompt Creating sequence SEQ_OS_WFENTRY
prompt ================================
prompt
create sequence SEQ_OS_WFENTRY
minvalue 10
maxvalue 999999999999999999999999999
start with 10
increment by 1
cache 20
/

prompt
prompt Creating sequence SEQ_WF_INITIATOR
prompt ==================================
prompt
create sequence SEQ_WF_INITIATOR
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20
/

prompt
prompt Creating sequence S_TCATEGORYINFO
prompt =================================
prompt
create sequence S_TCATEGORYINFO
minvalue 1
maxvalue 999999999999999999999999999
start with 202
increment by 1
cache 20
/

prompt
prompt Creating sequence S_TCMDDEF
prompt ===========================
prompt
create sequence S_TCMDDEF
minvalue 1
maxvalue 999999999999999999999999999
start with 561
increment by 1
cache 20
/

prompt
prompt Creating sequence S_TCMDOPER
prompt ============================
prompt
create sequence S_TCMDOPER
minvalue 1
maxvalue 999999999999999999999999999
start with 3252
increment by 1
cache 20
/

prompt
prompt Creating sequence S_TCMDRESTRICT
prompt ================================
prompt
create sequence S_TCMDRESTRICT
minvalue 1
maxvalue 999999999999999999999999999
start with 59
increment by 1
cache 20
/

prompt
prompt Creating sequence S_TCMDVALIDATE
prompt ================================
prompt
create sequence S_TCMDVALIDATE
minvalue 1
maxvalue 999999999999999999999999999
start with 429
increment by 1
cache 20
/

prompt
prompt Creating sequence S_TCUSTUMOPERATE
prompt ==================================
prompt
create sequence S_TCUSTUMOPERATE
minvalue 1
maxvalue 999999999999999999999999999
start with 2775
increment by 1
cache 20
/

prompt
prompt Creating sequence S_TFIELDDIC
prompt =============================
prompt
create sequence S_TFIELDDIC
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20
/

prompt
prompt Creating sequence S_TFIELDMAP
prompt =============================
prompt
create sequence S_TFIELDMAP
minvalue 1
maxvalue 999999999999999999999999999
start with 101
increment by 1
cache 20
/

prompt
prompt Creating sequence S_TLIMITPARAMMAP
prompt ==================================
prompt
create sequence S_TLIMITPARAMMAP
minvalue 1
maxvalue 999999999999999999999999999
start with 135
increment by 1
cache 20
/

prompt
prompt Creating sequence S_TMESREFOBJ
prompt ==============================
prompt
create sequence S_TMESREFOBJ
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20
/

prompt
prompt Creating sequence S_TMESSAGE
prompt ============================
prompt
create sequence S_TMESSAGE
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20
/

prompt
prompt Creating sequence S_TOBJMODE
prompt ============================
prompt
create sequence S_TOBJMODE
minvalue 1
maxvalue 999999999999999999999999999
start with 2133
increment by 1
cache 20
/

prompt
prompt Creating sequence S_TOUTOBJ
prompt ===========================
prompt
create sequence S_TOUTOBJ
minvalue 1
maxvalue 999999999999999999999999999
start with 41
increment by 1
cache 20
/

prompt
prompt Creating sequence S_TQUERYFIELD
prompt ===============================
prompt
create sequence S_TQUERYFIELD
minvalue 1
maxvalue 999999999999999999999999999
start with 1160
increment by 1
cache 20
/

prompt
prompt Creating sequence S_TQUERYGROUP
prompt ===============================
prompt
create sequence S_TQUERYGROUP
minvalue 1
maxvalue 999999999999999999999999999
start with 20
increment by 1
cache 20
/

prompt
prompt Creating sequence S_TQUERYLINK
prompt ==============================
prompt
create sequence S_TQUERYLINK
minvalue 1
maxvalue 999999999999999999999999999
start with 107
increment by 1
cache 20
/

prompt
prompt Creating sequence S_TQUERYORDER
prompt ===============================
prompt
create sequence S_TQUERYORDER
minvalue 1
maxvalue 999999999999999999999999999
start with 8
increment by 1
cache 20
/

prompt
prompt Creating sequence S_TQUERYREF
prompt =============================
prompt
create sequence S_TQUERYREF
minvalue 1
maxvalue 999999999999999999999999999
start with 211
increment by 1
cache 20
/

prompt
prompt Creating sequence S_TRECEIVERMES
prompt ================================
prompt
create sequence S_TRECEIVERMES
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20
/

prompt
prompt Creating sequence S_TRELATIONOBJ
prompt ================================
prompt
create sequence S_TRELATIONOBJ
minvalue 1
maxvalue 999999999999999999999999999
start with 6148
increment by 1
cache 20
/

prompt
prompt Creating sequence S_TTABLEHISTORY
prompt =================================
prompt
create sequence S_TTABLEHISTORY
minvalue 1
maxvalue 999999999999999999999999999
start with 3955
increment by 1
cache 20
/
	
prompt
prompt Creating sequence S_TTABLEOBJ
prompt =============================
prompt
create sequence S_TTABLEOBJ
minvalue 1
maxvalue 999999999999999999999999999
start with 72681
increment by 1
cache 20
/

prompt
prompt Creating sequence S_TTABLEOBJHISTORY
prompt ====================================
prompt
create sequence S_TTABLEOBJHISTORY
minvalue 1
maxvalue 999999999999999999999999999
start with 25280
increment by 1
cache 20
/

prompt
prompt Creating sequence S_TTRANS
prompt ==========================
prompt
create sequence S_TTRANS
minvalue 1
maxvalue 999999999999999999999999999
start with 241
increment by 1
cache 20
/

prompt
prompt Creating sequence S_TUSERPREFERENCES
prompt ====================================
prompt
create sequence S_TUSERPREFERENCES
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20
/

prompt
prompt Creating sequence S_TVIEWOBJ
prompt ============================
prompt
create sequence S_TVIEWOBJ
minvalue 1
maxvalue 999999999999999999999999999
start with 27459
increment by 1
cache 20
/

prompt
prompt Creating sequence S_TVIEWOBJHISTORY
prompt ===================================
prompt
create sequence S_TVIEWOBJHISTORY
minvalue 1
maxvalue 999999999999999999999999999
start with 17115
increment by 1
cache 20
/

prompt
prompt Creating sequence S_LBWEBSERVICESESSION
prompt ===================================
prompt
create sequence S_LBWEBSERVICESESSION
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20
/

prompt
prompt Creating package TYPES
prompt ======================
prompt
CREATE OR REPLACE PACKAGE "TYPES" as
    type cursorType is ref cursor;
end "TYPES";
/

prompt
prompt Creating procedure PNEXTID
prompt ==========================
prompt
CREATE OR REPLACE PROCEDURE pNextID
(
  tablename IN VARCHAR2,
  idno OUT NUMBER
) IS
  sqlstring VARCHAR2(500);
BEGIN
  update tSEQUENCE set id= id+1 where Name=tablename;
  IF sql%rowcount=0 THEN
     sqlstring := 'INSERT INTO tSEQUENCE(name,id) values('''||tablename||''',1)';
     Execute Immediate sqlstring;
     idno:=1;
  ELSE
    SELECT id into idno FROM tSEQUENCE WHERE name = tablename;
  END IF;
END;
/
alter   procedure   pNextID  compile
/

prompt
prompt Creating procedure PNEXTVAL
prompt ===========================
prompt
create or replace procedure pNextVal
(
	p_tablename in  varchar2,
	p_seed in number,
	p_increment in number,
  p_id out number
)  is
  begin
  select nvl(ID,p_seed) into p_id from tSEQUENCE where Name=p_tablename;
  if SQL%NOTFOUND  then
      p_id:=p_seed;
      insert into tSEQUENCE (Name,ID) values(p_tablename,p_seed);
  else
      p_id:=p_id + p_increment;
      update tSEQUENCE set ID=p_id where Name=p_tablename;
  end if;
end;
/

alter   procedure   Pnextval   compile
/

prompt
prompt Creating procedure ABS_NEXTSERIALNO
prompt ===================================
prompt
CREATE OR REPLACE PROCEDURE ABS_NEXTSERIALNO (objname in varchar2,seed in number,increment in number,idOut out number)
is
temp_seed number;
begin
  select nvl(min(ID),-1) into temp_seed from tCustomSerial where Name=objname ;
  if temp_seed <= 0 then
     idOut:=seed;
     insert into tCustomSerial (Name,ID) values(objname,seed);
  else
     select nvl(ID,seed) into idOut  from tCustomSerial where Name=objname ;
     idOut:=idOut+increment;
     update tCustomSerial set ID=idOut where Name=objname;
  end if;

end ABS_NEXTSERIALNO;
/

alter   procedure   ABS_NEXTSERIALNO   compile
/

prompt
prompt Creating procedure ABS_SEQUEND
prompt ==============================
prompt
CREATE OR REPLACE PROCEDURE ABS_SEQUEND(vname IN VARCHAR2,vseed in number, vincrement in number,idno OUT NUMBER) IS
BEGIN
  SELECT nvl(max(ID),0) into idno FROM tIDSerial WHERE name = vname;
  IF idno = 0 THEN
     idno:=nvl(vseed,1);
     insert into Tidserial(Name,ID) values(vname, idno );
  ELSE
     idno := idno + nvl(vincrement,1);
   update tIDSerial set id= idno where Name=vname;
  END IF;

END;
/

alter   procedure   ABS_SEQUEND   compile
/

prompt
prompt Creating procedure pNextID
prompt ==============================
prompt
CREATE OR REPLACE PROCEDURE pNextID
(
  tablename IN VARCHAR2,
  idno OUT NUMBER
) IS
  sqlstring VARCHAR2(500);
  l_cur_handle INTEGER;
  l_status NUMBER;
BEGIN
  update tSEQUENCE set id= id+1 where Name=tablename;
  IF sql%rowcount=0 THEN
     sqlstring := 'INSERT INTO tSEQUENCE(name,id) values('''||tablename||''',1)';
     l_cur_handle := DBMS_SQL.OPEN_CURSOR;
     DBMS_SQL.PARSE(l_cur_handle,sqlstring,DBMS_SQL.NATIVE);
     l_status :=DBMS_SQL.EXECUTE(l_cur_handle);
     DBMS_SQL.CLOSE_CURSOR(l_cur_handle);
     idno:=1;
  ELSE
    SELECT id into idno FROM tSEQUENCE WHERE name = tablename;

  END IF;
EXCEPTION
  WHEN OTHERS THEN
    IF DBMS_SQL.IS_OPEN(l_cur_handle) = TRUE THEN
       DBMS_SQL.CLOSE_CURSOR(l_cur_handle);
  END IF;
  commit;
END;
/
alter   procedure   pNextID  compile
/
prompt
prompt Creating procedure lbpUpdateWFEntrySubject
prompt ==============================
prompt
create or replace procedure lbpUpdateWFEntrySubject is
  wf_name varchar2(200);
  tablename varchar2(200);
  fieldname varchar2(200);
  sqlStr varchar2(1024);
BEGIN
  declare cursor pCursor is select wf_name from os_workflowdefs;
  begin
  open pCursor;
  fetch  pCursor into wf_name;
  while  pCursor%found
  loop
      begin
          select Tablename into tablename from ttable where srcTab=wf_name and rownum=1;
          fieldname := null;
          begin
               sqlStr :='select name  from ttableobj where tablename=''' || tablename ||''' and 2=(select bitAnd(attribute,2) from dual) and rownum=1';
               Execute Immediate sqlStr into fieldname;
          exception
          when NO_DATA_FOUND then
               begin
                   sqlStr :='select name  from ttableobj where tablename=''' || tablename ||''' and 1=(select bitAnd(attribute,1) from dual) and rownum=1';
                   Execute Immediate sqlStr into fieldname;
               exception
               when NO_DATA_FOUND then
                   sqlStr :='select name  from ttableobj where tablename=''' || tablename ||''' and 2=(select bitAnd(primarykey,2) from dual) and rownum=1';
                   Execute Immediate sqlStr into fieldname;
               end;
          end;
          sqlStr:='update os_wfentry set os_wfentry.subject = (select '|| tablename ||'.'|| fieldname ||' from '|| tablename ||'  where os_wfentry.ID = '|| tablename ||'.instid) where exists (select '|| tablename ||'.instid from '|| tablename ||'  where os_wfentry.ID = '|| tablename ||'.instid)';
          Execute Immediate sqlStr;
      exception
      when NO_DATA_FOUND then
           null;
      end;
    fetch  pCursor into wf_name;
  end loop;
  close pCursor;
  commit;
  end;
END lbpUpdateWFEntrySubject;

/
call lbpUpdateWFEntrySubject()
/
prompt
prompt Creating procedure lbpInitFDNCode
prompt ==============================
prompt
create or replace procedure lbpInitFDNCode(tablename in varchar2) is
  id int;
  n int;
  grade int;
  sid varchar(100);
  sqlStr varchar(1024);
  re_str varchar(100);
  type v_tcursor is ref cursor;
  pCursor v_tcursor;
BEGIN
  re_str := '';
  sqlStr := 'select ID from ' || tablename;
  Execute Immediate sqlStr;
  BEGIN
  OPEN pCursor for sqlStr;
  FETCH  pCursor INTO id;
  WHILE pCursor%found
  LOOP
	    BEGIN
    		sid := id;
    		sqlStr := 'select FID from '||tablename||' where ID = '|| id;
    		Execute Immediate sqlStr into re_str;
    		grade := 0;
    		sqlStr := 'select count(*) from '||tablename||' where ID = '||id||' and FID <> 0';
    		Execute Immediate sqlStr into n;
    		WHILE(n>0)
            LOOP    		
    			sqlStr := 'select  b.ID, b.FID || ''.'' || '''  ||re_str || ''' as re_str from '||tablename||' a , '||tablename||' b where a.ID = '||id||' and a.FID = b.ID';          
          		Execute Immediate sqlStr into id,re_str;
    			sqlStr := 'select count(*) from '||tablename||' where ID = '||id||' and FID <> 0';
    			Execute Immediate sqlStr into n;
    			grade := grade + 1;
    		END LOOP;
    		sqlStr := 'update '||tablename||' set FDNCode='''||re_str||''',Grade='||grade||' where ID='|| sid;
    		Execute Immediate sqlStr;
      END;
		FETCH pCursor INTO id;
	END LOOP;
  CLOSE pCursor;
  COMMIT;
  END;
END lbpInitFDNCode;
/

CREATE OR REPLACE PROCEDURE lb_pro_range_id
(
  tablename IN VARCHAR2,
  initialValue OUT NUMBER,
  rangeNo  OUT NUMBER,
  rangeSize  OUT NUMBER
) IS
  sqlstring VARCHAR2(500);
BEGIN
  update tSEQUENCE set RANGE_NO=nvl(RANGE_NO,0)+1 where Name = tablename;
  IF sql%rowcount=0 THEN
     sqlstring := 'INSERT INTO tSEQUENCE(name,id,RANGE_NO) SELECT '''||tablename||''',nvl(max(id),0)+1 , 0 FROM '||tablename;
     Execute Immediate sqlstring;
  END IF;
  SELECT id  , RANGE_NO  ,RANGE_SIZE into initialValue , rangeNo, rangeSize FROM tSEQUENCE WHERE name = tablename;
END;
/

create table lbMessageSender
(
  ID		NUMBER(16)	not null,
  RECEIVER	VARCHAR2(1024)	not null,
  TITLE		VARCHAR2(300)	not null,
  MESSAGE	VARCHAR2(1024),
  "DATE"	DATE,
  Sender	NUMBER(22)	not null,
  CONSTRAINT PK_LBMESSAGESENDER PRIMARY KEY (ID)
)
/

--系统数据备份和恢复
create table tsysdbback(
  backidef	 varchar2(64)	not null,
  backpath	 varchar2(512)	not null,
  backTime	 date		not null,
  backsize	 varchar2(16),
  backjndi	 varchar2(64),
  CONSTRAINT PK_tsysdbback PRIMARY KEY (backidef)
)
/

CREATE TABLE lbScheduleView
(
  status	varchar2(300),
  scheduleName	varchar2(100),
  scheduleDes	varchar2(300),
  firedDate	varchar2(20),
  firedTime	varchar2(20),
  notify	varchar2(50),
  parameter	varchar2(2048),
  memo		varchar2(2048)
)
/

create table lbSysConfig (
   ID		number(16)	not null,
   Name		varchar2(100)	not null,
   Type		int		not null,
   Value	varchar2(200)	null,
   Note		varchar2(1024)	null,
   Definition	clob		null, 
   constraint PK_LBSYSCONFIG primary key  (ID)
)
/

create table lbUserProject (
   ID		number(16)	not null,
   Name		varchar2(30)	not null,
   Describe	varchar2(100)	not null,
   Note		varchar2(512)	null,
   Grade	int		null,
   Type		int		null,
   Priority	int		null,
   Attribute	int		null,
   Available	smallint	null,
   Roles	varchar2(2048)	null,
   MenuDefinition	clob	null,
   constraint PK_LBUSERPROJECT primary key  (ID)
)
/

create table lbUserProjectConfig (
   ID		number(16)	not null,
   UserProject	varchar2(30)	not null,
   Type		int		not null,
   Name		varchar2(100)	not null,
   Value	varchar2(200)	null,
   Note		varchar2(1024)	null,
   constraint PK_LBUSERPROJECTCONFIG primary key  (ID)
)
/

CREATE TABLE LBUSERMSGCHANNEL  (
   ID		NUMBER(12)	NOT NULL,
   USERID	NUMBER(12)	NOT NULL,
   MSGCHANNEL	VARCHAR2(30)	NOT NULL,
   MsgType	varchar2(30),
   IsOpen	smallint,
   NoticeType	int,
   CONSTRAINT PK_LBUSERMSGCHANNEL PRIMARY KEY (ID)
)
/

CREATE TABLE LBUSERWORKFLOWMSG  (
   ID		NUMBER(12)	NOT NULL,
   USERID	NUMBER(12)	NOT NULL,
   TYPE		NUMBER(12)	NOT NULL,
   WF_NAME	VARCHAR2(256),
   CONSTRAINT PK_LBUSERWORKFLOWMSG PRIMARY KEY (ID)
)
/

COMMENT ON COLUMN LBUSERWORKFLOWMSG.TYPE IS
'0:禁止这个流程消息'
/

create table lbTicketRegistry  (
   ID		NUMBER(16)	not null,
   Ticket	VARCHAR2(32)	not null,
   "UID"	NUMBER(16),
   Flag		INTEGER,
   Target	VARCHAR2(2048)	not null,
   CreationTime	DATE		not null,
   Expired	SMALLINT,
   InvalidateTime	DATE,
   Client	VARCHAR2(100),
   constraint PK_LBTICKETREGISTRY primary key (ID)
)
/

create table lbWebServiceSession  (
 ID		number(16) NOT NULL,
 sessionId	varchar2(50) NOT NULL,
 scheme		varchar2(50) NULL,
 creationTime	number(16) NULL,
 lastAccessedTime number(16) NULL,
 thisAccessedTime number(16) NULL,
 userId		varchar2(50) NULL,
 accessCount	number(16) NULL,
   constraint PK_LBWEBSERVICESESSION primary key (ID)
)
/

create table lbWFCurrentOwner  (
   ID		NUMBER(16)	not null,
   STEPID	NUMBER(16),
   OWNER	VARCHAR2(20),
   FLAG		INTEGER,
   STATUS	INTEGER,
   constraint PK_LBWFCURRENTOWNER primary key (ID)
)
/

create sequence s_lbWFCurrentOwner
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20
/
create sequence s_lbWFNotify
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20
/
create sequence s_lbWFNotifyMsg
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20
/

create table lbWFNotifyMsg  (
   ID		NUMBER(12)	not null,
   instanceID	NUMBER(12),
   stepID 	NUMBER(12),
   extActID	NUMBER(12),
   message	VARCHAR2(300),
   createTime	DATE,
   RID		int,
   suggestion	varchar2(300),
   constraint PK_LBWFNOTIFYMSG primary key (ID)
)
/

create table lbWFNotify  (
   ID		NUMBER(12)	not null,
   Owner	NUMBER(12)	not null,
   messageID	NUMBER(12)	not null,
   readed	SMALLINT	not null,
   readTime	DATE,
   RID		int,
   constraint PK_LBWFNOTIFY primary key (ID)
)
/


alter table lbWFNotify
   add constraint FK_LBWFNOTI_REFERENCE_LBWFNOTI foreign key (messageID)
      references lbWFNotifyMsg (ID)
/

create sequence S_lbTicketRegistry
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20
/

CREATE TABLE LBWORKSTATISTIC  (
   ID		NUMBER(12)	NOT NULL,
   WF_NAME	VARCHAR2(200)	NOT NULL,
   VERSION	INTEGER,
   DESCRIBE	VARCHAR2(1024),
   LASTIP	VARCHAR2(30),
   LASTUID	NUMBER(12),
   LASTTIME	DATE,
   STARTTIME	DATE,
   ELAPSED	NUMBER(18),
   AVGELAPSED	NUMBER(12),
   MAXELAPSED	NUMBER(12),
   MINELAPSED	NUMBER(12),
   INSTANCES	NUMBER(12),
   CREATEDS	NUMBER(12),
   SUSPENDEDS	NUMBER(12),
   KILLEDS	NUMBER(12),
   COMPLETEDS	NUMBER(12),
   ACTIVATEDS	NUMBER(12),
   UNKNOWNS	NUMBER(12),
   CONSTRAINT PK_LBWORKSTATISTIC PRIMARY KEY (ID)
)
/

CREATE TABLE LBWORKACTIONSTATISTIC  (
   ID		NUMBER(12)	NOT NULL,
   WID		NUMBER(12),
   STEP_ID	INTEGER,
   ACTION_ID	INTEGER,
   ELAPSED	NUMBER(16),
   AVGELAPSED	NUMBER(12),
   MAXELAPSED	NUMBER(12),
   MINELAPSED	NUMBER(12),
   EXECUTES	NUMBER(12),
   CONSTRAINT PK_LBWORKACTIONSTATISTIC PRIMARY KEY (ID)
)
/

CREATE TABLE LBWORKCOMMUNICATION  (
   ID                 NUMBER(16)       NOT NULL,
   ORIGINSTEPID       NUMBER(16),
   FID                NUMBER(16,0),
   INVITER            NUMBER(16),
   SUBJECT            VARCHAR2(1024),
   ANSWERER           VARCHAR2(20),
   CONSIGNER          VARCHAR2(20),
   "DATE"             DATE,
   RESPONSE           VARCHAR2(1024),
   STATUS             SMALLINT,
   CONSTRAINT PK_LBWORKCOMMUNICATION PRIMARY KEY (ID)
)
/

CREATE TABLE LBWORKCOMMUOWNER  (
   ID            NUMBER(16),
   COMMID        NUMBER(16),
   INVITEE       VARCHAR2(20)
)
/
ALTER TABLE LBWORKCOMMUOWNER
   ADD CONSTRAINT FK_WFCOMMOWNER_REF FOREIGN KEY (COMMID)
      REFERENCES LBWORKCOMMUNICATION (ID)
/


CREATE TABLE LBOPERATESTATISTIC  (
   ID		NUMBER(12)	NOT NULL,
   OBJNAME	VARCHAR2(200)	NOT NULL,
   OPERATORNAME	VARCHAR2(200),
   DESCRIBE	VARCHAR2(1024),
   LASTIP	VARCHAR2(30),
   LASTUID	NUMBER(12),
   LASTTIME	DATE,
   STARTTIME	DATE,
   ELAPSED	NUMBER(16),
   AVGELAPSED	NUMBER(12),
   MAXELAPSED	NUMBER(12),
   MINELAPSED	NUMBER(12),
   ACCESSCOUNT	NUMBER(12),
   EXECUTECOUNT	NUMBER(12),
   CONSTRAINT PK_LBOPERATESTATISTIC PRIMARY KEY (ID)
)
/

CREATE TABLE LBOBJSTATISTIC  (
   ID		NUMBER(12)	NOT NULL,
   NAME		VARCHAR2(200)	NOT NULL,
   DESCRIBE	VARCHAR2(1024),
   LASTIP	VARCHAR2(30),
   LASTUID	NUMBER(12),
   LASTTIME	DATE,
   STARTTIME	DATE,
   ELAPSED	NUMBER(16),
   AVGELAPSED	NUMBER(12),
   MAXELAPSED	NUMBER(12),
   MINELAPSED	NUMBER(12),
   ACCESSCOUNT	NUMBER(12),
   EXECUTECOUNT	NUMBER(12),
   CONSTRAINT PK_LBOBJSTATISTIC PRIMARY KEY (ID)
)
/

CREATE TABLE LBOBJECTPERMISSION  (
   ID		NUMBER(12)	NOT NULL,
   TYPE		SMALLINT	NOT NULL,
   MEMBERID	NUMBER(12)	NOT NULL,
   OBJNAME	VARCHAR2(200)	NOT NULL,
   ATTRIBUTE	INT,
   AUDITFLAG	INT		NOT NULL,
   AUTHDATE	DATE		NOT NULL,
   AuthUser	int,
   CONSTRAINT PK_LBOBJECTPERMISSION PRIMARY KEY (ID)
)
/

create table lbChangeLog 
(
   ID             integer          not null, 
   objectName     varchar2(120)    null,
   uudi           varchar2(64)     null,
   version        varchar2(32)     null,
   modifier       varchar2(50)     null,
   modifyDate     varchar2(20)     null,
   commentInfo    varchar2(1024)   null,
   primary key (ID)
)
/

create table lbchecksumno (
   ID		int		NOT NULL,
   name		varchar2(200)	NOT NULL,
   type		int		NOT NULL,
   serialNo	varchar2(64)	NOT NULL,
   primary key (ID)
) 
/

CREATE TABLE LBCIPHER  (
   ID		INTEGER		NOT NULL,
   KEYNAME	VARCHAR2(200)	NOT NULL,
   KEYVALUE	VARCHAR2(800)	NOT NULL,
   CONSTRAINT PK_LBCIPHER PRIMARY KEY (ID)
)
/
CREATE UNIQUE INDEX INDEX_KEYNAME ON LBCIPHER (
   KEYNAME ASC
)
/

create table lbClusterMember
(
  SystemId	VARCHAR2(40)	not null,
  IP		VARCHAR2(30)    not null,
  UpdateState	INTEGER		not null,
  OnlineUserNum INTEGER		not null,
  Joined	INTEGER		not null
)
/

CREATE TABLE LBCOLUMNPERMISSION  (
   ID		NUMBER(12)	NOT NULL,
   OID		NUMBER		NOT NULL,
   COLNAME	VARCHAR2(200)	NOT NULL,
   PERMISSION	INT		NOT NULL,
   ATTRIBUTE	INT,
   CONSTRAINT PK_LBCOLUMNPERMISSION PRIMARY KEY (ID)
)
/
ALTER TABLE LBCOLUMNPERMISSION
   ADD CONSTRAINT FK_LBCOLUMN_REFERENCE_LBOBJECT FOREIGN KEY (OID)
      REFERENCES LBOBJECTPERMISSION (ID)
/
ALTER TABLE LBWORKACTIONSTATISTIC
   ADD CONSTRAINT FK_LBWORKAC_REFERENCE_LBWORKST FOREIGN KEY (WID)
      REFERENCES LBWORKSTATISTIC (ID)
/

CREATE TABLE PORTLET (
  ID 		varchar2(255)  	NOT NULL ,
  displayName 	varchar2(255)  	NULL ,
  portletApplicationName varchar2(255)  NULL ,
  portletName 	varchar2(255)  	NULL ,
  description 	varchar2(255)  	NULL ,
  createdDate 	date 		NULL ,
  modifiedDate 	date		NULL ,
  portletCategoryId 	varchar2(255)  	NULL ,
  constraint PK_PORTLET primary key (ID) 
)
/

CREATE TABLE PORTLET_CATEGORY (
  ID 			varchar2(255)	NOT NULL ,
  portletCategoryName 	varchar2(255)	NULL ,
  description 		varchar2(255)	NULL ,
  createdDate 		date		NULL ,
  modifiedDate 		date		NULL ,
  constraint PK_PORTLET_CATEGORY primary key (ID) 
) 
/

CREATE TABLE PORTLET_ROLE (
  ID			varchar2(255)	NOT NULL ,
  portletRoleName 	varchar2(255)	NULL ,
  portletId 		varchar2(255)	NULL ,
  constraint PK_PORTLET_ROLE primary key (ID) 
) 
/

create table lbFunAuditScope (
   ID		int	not null,
   Type		int	not null,
   MemberID	int	not null,
   FunName	varchar2(60) not null,
   AuditFlag	int	not null,
   AuthDate	date	not null,
   AuditDate	date	null,
   AuthUser	int	null,
   AuditUser	int	null,
   StartDate	date	null,
   EndDate	date	null,
   constraint PK_LBFUNAUDITSCOPE primary key(ID)
)
/
   comment on column lbFunAuditScope.Type is
   '0|用户/1|角色/2|组织/'
/
   comment on column lbFunAuditScope.AuditFlag is
   '0|未审核/1|已审核'
/
   comment on column lbFunAuditScope.StartDate is
   'null为不限制'
/
   comment on column lbFunAuditScope.EndDate is
   'null为不限制'
/

create table lbFunDefinition (
   ID		int		not null,
   FID		int		not null,
   Grade	int		not null,
   Type		int		not null,
   FunType	int		not null,
   Name		varchar2(60)	not null,
   Describe	varchar2(200)	not null,
   Note		varchar2(1024)	null,
   FDNCode	varchar2(300)	not null,
   Object	varchar2(200)	null,
   ObjectType	int		null,
   constraint PK_LBFUNDEFINITION primary key(ID)
)
/
   comment on column lbFunDefinition.FunType is
   '0:应用/1:模块/2:业务包/3:业务/3:功能'
/
   comment on column lbFunDefinition.Object is
   '业务对象的对象名称'
/

create table lbFunFactor (
   ID		int		not null,
   FunName	varchar2(60)	not null,
   Type		int		not null,
   Object	varchar2(256)	null,
   Operator	varchar2(256)   null,
   OperatorType	int             null,
   Note         varchar2(1024)  null,
   constraint PK_LBFUNFACTOR primary key (ID)
)
/
comment on column lbFunFactor.Type is
'0(默认):普通对象,1:系统对象,2:虚拟门户,3:portlet,4:自定义资源,5:从属对象'
/

comment on column lbFunFactor.OperatorType is
'0:系统操作,1:自定义操作'
/

create table lbFunPermission (
   ID		int	not null,
   Type		int	not null,
   MemberID	int	not null,
   FunName	varchar2(60) not null,
   AuditFlag	int	not null,
   AuthDate	date	not null,
   AuditDate	date	null,
   AuthUser	int	null,
   AuditUser	int	null,
   StartDate	date	null,
   EndDate	date	null,
   constraint PK_LBFUNPERMISSION primary key(ID)
)
/
   comment on column lbFunPermission.Type is
   '0|用户/1|角色/2|组织/'
/
   comment on column lbFunPermission.AuditFlag is
   '0|未审核/1|已审核'
/
   comment on column lbFunPermission.StartDate is
   'null为不限制'
/
   comment on column lbFunPermission.EndDate is
   'null为不限制'
/

create table lbFunPermissionScope (
   ID		int	not null,
   Type		int	not null,
   MemberID	int	not null,
   FunName	varchar2(60) not null,
   AuditFlag	int	not null,
   AuthDate	date	not null,
   AuditDate	date	null,
   AuthUser	int	null,
   AuditUser	int	null,
   EndDate	date	null,
   StartDate	date	null,
   constraint PK_LBFUNPERMISSIONSCOPE primary key(ID)
)
/
   comment on column lbFunPermissionScope.Type is
   '0|用户/1|角色/2|组织/'
/
   comment on column lbFunPermissionScope.AuditFlag is
   '0|未审核/1|已审核'
/
   comment on column lbFunPermissionScope.EndDate is
   'null为不限制'
/
   comment on column lbFunPermissionScope.StartDate is
   'null为不限制'
/

/*功能权限树多语言*/
create table lbFunDefinition_I18N 
(
   FunType            int                  not null,
   Name               varchar(60)          not null,
   Lang               varchar(30)          not null,
   Describe           varchar(200)         not null
)
/

create table lbRoleScope (
   ID		int	not null,
   Type		int	not null,
   MemberID	int	not null,
   RoleID	int	not null,
   AuditFlag	int	not null,
   AuthDate	date	not null,
   AuditDate	date	null,
   AuthUser	int	not null,
   AuditUser	int	null,
   constraint PK_LBROLESCOPE primary key (ID)
)
/
   comment on column lbRoleScope.Type is
   '0|用户/1|角色/2|组织/'
/
   comment on column lbRoleScope.AuditFlag is
   '0|未审核/1|已审核'
/

create table lbFunAuthLog  (
   ID		INTEGER		not null,
   AuthUser	INTEGER		not null,
   AuthDate	DATE		not null,
   AuthOperate	VARCHAR2(30)	not null,
   Type		INTEGER		not null,
   MemberID	INTEGER		not null,
   PowerType	smallint	null,
   IP		varchar2(30),
   constraint PK_LBFUNAUTHLOG primary key (ID)
)
/
  comment on column lbFunAuthLog.AuthOperate is
  'grant|授权/remove|移除/audit|审核/Add|对象新增/Update|对象修改/Delete|对象删除'
/
  comment on column lbFunAuthLog.Type is
  '0|用户/1|角色/2|组织/'
/

create table lbRoleMutex  (
   ID		INTEGER		not null,  
   RoleID	INTEGER		not null,
   MutexRoleID	INTEGER		not null,
   Memo		VARCHAR2(1024)	null,   
   constraint PK_LBROLEMUTEX primary key (ID)
)
/

CREATE TABLE LBNAVPAGE  (
   ID		INTEGER		NOT NULL,
   NAME		VARCHAR2(60)	NOT NULL,
   DESCRIBE	VARCHAR2(200)	NOT NULL,
   NOTE		VARCHAR2(500),
   CATEGORY	VARCHAR2(200),
   PROPERTIES		CLOB,
   ITEMDEFINITION       CLOB,
   CONSTRAINT PK_LBNAVPAGE PRIMARY KEY (ID)
)
/

create table LBFEEDCOMMENT
(
  ID             INTEGER not null,
  FEEDID         INTEGER not null,
  COMMENTATOR    INTEGER not null,
  COMMENTCONTENT VARCHAR2(1000) not null,
  COMMENTTIME    DATE not null,
  SCORE          NUMBER not null,
  FEEDACTORID    INTEGER,
  FEEDCONTENT    VARCHAR2(1000)
)
/
alter table LBFEEDCOMMENT
  add constraint FEEDCOMMENT_ID unique (ID) 
/
create index FEEDCOMMENT_FEEDID on LBFEEDCOMMENT (FEEDID) 
/

create table LBFEEDFAVORITE
(
  ID      INTEGER,
  ACTORID INTEGER,
  FEEDID  INTEGER
) 
/
alter table LBFEEDFAVORITE
  add constraint FEEDFAVORITE_ID unique (ID) 
/
create index FEEDFAVORITE_ACTORID on LBFEEDFAVORITE (ACTORID) 
/

create table LBFEEDFILE
(
  ID      INTEGER,
  OLDNAME VARCHAR2(1000),
  NEWNAME VARCHAR2(100),
  TYPE    INTEGER,
  FEEDID  INTEGER
) 
/
alter table LBFEEDFILE
  add constraint LBFEEDFILE_ID unique (ID) 
/
 
 create table LBFEEDMESSAGE
(
  ID           INTEGER not null,
  ACTORID      INTEGER not null,
  GROUPID      INTEGER not null,
  CREATETIME   DATE not null,
  FEEDTYPE     INTEGER not null,
  FORMATTYPE   INTEGER not null,
  SUBJECT      VARCHAR2(1000) not null,
  CONTENT      VARCHAR2(1000) not null,
  TEMPLATEID   INTEGER not null,
  SRCFEEDID    INTEGER not null,
  STATUS       INTEGER not null,
  COMMENTCOUNT INTEGER not null,
  FORWARDCOUNT INTEGER not null,
  IMAGENAME    VARCHAR2(100),
  TOPICID      INTEGER,
  EventType    INTEGER
) 
/
alter table LBFEEDMESSAGE
  add constraint FEEDMESSAGE_ID unique (ID) 
/
create index FEEDMESSAGE_ACTORID on LBFEEDMESSAGE (ACTORID) 
/
create index FEEDMESSAGE_GROUPID on LBFEEDMESSAGE (GROUPID) 
/

create table LBFEEDMSGGROUP
(
  ID         INTEGER not null,
  NAME       VARCHAR2(200) not null,
  CREATOR    INTEGER not null,
  DESCRIBE   VARCHAR2(1024) null,
  TYPE       INTEGER not null,
  STATUS     INTEGER not null,
  CREATEDATE DATE not null
) 
/
alter table LBFEEDMSGGROUP
  add constraint FEEDMSGGROUP_ID unique (ID) 
/
create index FEEDMSGGROUP_TYPE on LBFEEDMSGGROUP (TYPE) 
/

create table LBFEEDMSGGROUPMEMBER
(
  ID       INTEGER not null,
  GROUPID  INTEGER not null,
  USERID   INTEGER not null,
  TYPE     INTEGER not null,
  JOINTIME DATE not null,
  GroupHome INTEGER DEFAULT (0),
  FeedHome INTEGER DEFAULT (0)
) 
/
alter table LBFEEDMSGGROUPMEMBER
  add constraint FEEDMSGGROUPMEMBER_ID unique (ID) 
/
create index FEEDMSGGROUPMEMBER_GROUPID on LBFEEDMSGGROUPMEMBER (GROUPID) 
/

create table LBFEEDMSGTEMPLATE
(
  ID            INTEGER not null,
  SUBJECTDEFINE VARCHAR2(1024) not null,
  CONTENTDEFINE VARCHAR2(1024) not null
) 
/
alter table LBFEEDMSGTEMPLATE
  add constraint LBFEEDMSGTEMPLATE_ID unique (ID) 
/

 create table LBUSERFEED
(
  ID         INTEGER not null,
  USERID     INTEGER not null,
  FEEDID     INTEGER not null,
  READTIME   DATE not null,
  UPDATETIME DATE not null,
  STATUS     INTEGER not null
) 
/
alter table LBUSERFEED
  add constraint USERFEED_ID unique (ID) 
/
create index USERFEED_FEEDID on LBUSERFEED (FEEDID) 
/
create index USERFEED_USERID on LBUSERFEED (USERID) 
/

create table LBUSERFEEDSUMMARY
(
  ID           INTEGER not null,
  USERID       INTEGER not null,
  LASTFEEDID   INTEGER not null,
  LASTREADTIME DATE not null,
  LASTREADFEEDID INTEGER ,
  FEEDCOUNT    INTEGER ,
  LASTREADFEEDCOMMENTID INTEGER ,
  LastReadFeedMentionID int default 0 ,
  LastReadFeedFollowID int default 0 
) 
/
alter table LBUSERFEEDSUMMARY
  add constraint LBUSERFEEDSUMMARY_ID unique (ID) 
/
create index LBUSERFEEDSUMMARY_USERID on LBUSERFEEDSUMMARY (USERID) 
/

create table LBUSERFOLLOWING
(
  ID         INTEGER not null,
  USERID     INTEGER not null,
  FOLLOWING  INTEGER not null,
  FOLLOWTIME DATE not null,
  TYPE       INTEGER not null
) 
/
alter table LBUSERFOLLOWING
  add constraint USERFOLLOWING_ID unique (ID) 
/
create index USERFOLLOWING_USERID on LBUSERFOLLOWING (USERID) 
/

create sequence S_LBUSERFEED
minvalue 1
maxvalue 999999999999999999999999999
start with 921
increment by 1
cache 20
/

create sequence S_lbFeedOptions
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20
/

create sequence S_lbFeedTopicUser
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20
/

create table lbFeedObjectRefs (
	ID		int	not null,
   	ObjName		varchar2(200)	not null,
   	ObjID		int	not null,
   	FeedID 		int	not null
) 
/
alter table lbFeedObjectRefs 
  add constraint PK_lbFeedObjectRefs primary key (ID)
/

create table lbFeedObjectEvent (
   	ID		int	not null,
   	ObjName		varchar2(200)	not null,
   	Target		int	not null,
   	UserID 		int	not null
) 
/
alter table lbFeedObjectEvent 
  add constraint PK_lbFeedObjectEvent primary key (ID)
/

create table lbDirectMessage
(
  ID        INTEGER not null,
  SUBJECT   VARCHAR2(1000) not null,
  CONTENT   VARCHAR2(1000) not null,
  SENDER    NUMBER(22) not null,
  RECEIVER  NUMBER(22) not null,
  USERID    NUMBER(22) not null,
  SENDTIME  DATE not null,
  RECEIVERS VARCHAR2(1024),
  STATE	    INTEGER default 0
)
/
alter table lbDirectMessage
  add constraint PK_lbDirectMessage primary key (ID)
/


create table lbFeedTopicUser
(
  ID        INTEGER not null,
  TPID      INTEGER not null,
  USERID    INTEGER not null,
  OPTIONIDS VARCHAR2(1000) not null,
  CONTEXT   VARCHAR2(2000) not null,
  TIME      DATE not null
 )
/
alter table lbFeedTopicUser
  add constraint PK_lbFeedTopicUser primary key (ID)
/

 create table lbFeedTopic
(
  ID        INTEGER not null,
  TOPICNAME VARCHAR2(1000) not null,
  TOPICEXPLAIN	VARCHAR2(2000) not null,
  OPTIONTYPE INTEGER not null,
  COUNTS     INTEGER not null,
  BEGINTIME  DATE not null,
  ENDTIME    DATE not null,
  TOPICUSER  INTEGER not null,
  GROUPID    INTEGER not null
 )
/
 alter table lbFeedTopic
  add constraint PK_lbFeedTopic primary key (ID)
/


 create table lbFeedOptions
(
  ID        INTEGER not null,
  TPID      INTEGER not null,
  OPTIONS   VARCHAR2(1000) not null,
  USERID    INTEGER not null,
  VOTES     INTEGER not null
)
/
 alter table lbFeedOptions
  add constraint PK_lbFeedOptions primary key (ID)
/

CREATE TABLE  lbFeedEventType 
(
  ID         INTEGER not null,
  EventType  VARCHAR2(1000)  
)
/
 alter table lbFeedEventType
  add constraint PK_lbFeedEventType primary key (ID)
/

CREATE TABLE  lbFeedEvent 
(
  ID		INTEGER not null, 
  EventType	INTEGER not null,
  Obj		INTEGER not null,
  UserID	INTEGER 
)
/
 alter table lbFeedEvent
  add constraint PK_lbFeedEvent primary key (ID)
/

CREATE  TABLE lbWFDEFS_I18N 
( 
	WF_NAME VARCHAR2(256) NOT NULL,
	LANG    VARCHAR2(30)    not null,
	WF_DESCRIBE varchar2(256),
	CATEGORY	varchar2(256)
)
/

CREATE TABLE tXTDM_I18N (
	FLDM varchar2 (30)   NOT NULL ,
	FLMC varchar2 (60)    NULL ,
	IBM number(14, 0) NOT NULL,
	CBM varchar2 (12)   NOT NULL ,
	NOTE varchar2 (50)   NOT NULL ,
	Lang VARCHAR2(30)    not null
) 
/

create table lbResourceBundle  (
   ID           INTEGER              not null,
   BaseName     VARCHAR2(200)        not null,
   ResType      INTEGER              not null,
   Lang         VARCHAR2(30)         not null,
   KeyName      VARCHAR2(200)        ,
   Value        VARCHAR2(1000)       not null,
   Note         VARCHAR2(1000),
   constraint PK_LBRESOURCEBUNDLE primary key (ID)
)
/

create sequence S_LBRESOURCEBUNDLE
minvalue 1
maxvalue 9999999999999999999999
start with 1
increment by 1
cache 20
/

create table lbTask (
  ID              NUMBER(10) not null,
  ATTACHMENTCOUNT NUMBER(10),
  CREATETIME      DATE,
  CREATOR         NUMBER(19),
  ENDTIME         DATE,
  GRADE           NUMBER(10),
  IMPORTANCE      NUMBER(10),
  PARENTID        NUMBER(10),
  PATH            VARCHAR2(1000),
  PLANENDTIME     DATE,
  PLANSTARTTIME   DATE,
  PROGRESS        NUMBER(10),
  ROOTID          NUMBER(19),
  SCHEDULECRON    VARCHAR2(100),
  SCHEDULENOTE    VARCHAR2(256),
  STARTTIME       DATE,
  STATUS          NUMBER(10),
  SUBTASKCOUNT    NUMBER(10),
  SUBJECT         VARCHAR2(510),
  SUMMARY         VARCHAR2(2000),
  TASKNAME        VARCHAR2(60),
  UPDATETIME      DATE,
  Priority	  int default 0
)
/
 alter table lbTask
  add constraint PK_lbTask primary key (ID)
/

create table lbTaskAttachment (
  ID         NUMBER(10) not null,
  CREATETIME DATE,
  CREATOR    NUMBER(19),
  DATA       BLOB,
  FEEDBACKID NUMBER(10),
  HITCOUNT   NUMBER(10),
  NAME       VARCHAR2(510),
  TASKID     NUMBER(10)
)
/
alter table lbTaskAttachment 
  add constraint PK_lbTaskAttachment primary key (ID)
/

create table lbTaskAttachmentHit (
  ID           NUMBER(10) not null,
  ATTACHMENTID NUMBER(10),
  CREATETIME   DATE,
  IP           VARCHAR2(256),
  USERID       NUMBER(19)
)
/
alter table lbTaskAttachmentHit 
  add constraint PK_lbTaskAttachmentHit primary key (ID)
/

create table lbTaskAuditInfo (
  ID         NUMBER(10) not null,
  CONFIRM    NUMBER(5),
  CONTENT    VARCHAR2(2000),
  CREATETIME DATE,
  TASKID     NUMBER(10),
  USERID     NUMBER(19)
)
/
alter table lbTaskAuditInfo 
  add constraint PK_lbTaskAuditInfo primary key (ID)
/

create table lbTaskDefs (
  ID         NUMBER(10) not null,
  ATTRIBUTE  NUMBER(10),
  CATEGORY   VARCHAR2(60),
  DEFINITION CLOB,
  DESCRIBE   VARCHAR2(512),
  FORMOBJECT VARCHAR2(2),
  NAME       VARCHAR2(60),
  OBJECTNAME VARCHAR2(100)
)
/
alter table lbTaskDefs 
  add constraint PK_lbTaskDefs primary key (ID)
/

create table lbTaskDefsI18N (
  OBJECTNAME VARCHAR2(100) not null,
  CATEGORY   VARCHAR2(512),
  DESCRIBE   VARCHAR2(512),
  LANG       VARCHAR2(60),
  NAME       VARCHAR2(512)
)
/
alter table lbTaskDefsI18N 
  add constraint PK_lbTaskDefsI18N primary key (ObjectName)
/

create table lbTaskFeedback (
  ID              NUMBER(10) not null,
  ATTACHMENTCOUNT NUMBER(10),
  CONTENT         VARCHAR2(2000),
  CREATETIME      DATE,
  CREATOR         NUMBER(19),
  RECEIVERTYPE    NUMBER(5),
  TASKID          NUMBER(10),
  "Type"          VARCHAR2(256)
)
/
alter table lbTaskFeedback 
  add constraint PK_lbTaskFeedback primary key (ID)
/

create table lbTaskFeedbackRecipient (
  ID        NUMBER(19) not null,
  FEEDID    NUMBER(10),
  ISREAD    NUMBER(10),
  RECIPIENT NUMBER(19)
)
/
alter table lbTaskFeedbackRecipient 
  add constraint PK_lbTaskFeedbackRecipient primary key (ID)
/

create table lbTaskTag (
  ID      NUMBER(10) not null,
  COLOR   VARCHAR2(14),
  CREATOR NUMBER(19),
  NOTE    VARCHAR2(2000),
  TAG     VARCHAR2(60)
)
/
alter table lbTaskTag 
  add constraint PK_lbTaskTag primary key (ID)
/

create table lbTaskUser (
  ID     NUMBER(10) not null,
  TASKID NUMBER(10),
  "Type"   NUMBER(10),
  USERID NUMBER(19)
)
/
alter table lbTaskUser 
  add constraint PK_lbTaskUser primary key (ID)
/

create table lbTaskUserTag (
  ID         NUMBER(10) not null,
  CREATETIME DATE,
  CREATOR    NUMBER(19),
  TAGID      NUMBER(10),
  TASKID     NUMBER(10)
)
/
alter table lbTaskUserTag 
  add constraint PK_lbTaskUserTag primary key (ID)
/

create index lbidx_task_parentId on lbTask (ParentID)
/
create index lbidx_task_subject on lbTask (Subject)
/
create index lbidx_task_users_type on lbTaskUser ("Type", TaskID, UserID)
/
create index lbidx_task_users on lbTaskUser (TaskID)
/

create table lbTaskObjectRefs (
   ID		number(10,0) 	not null,
   ObjName	varchar2(200)	not null,
   ObjID	number(10,0) 	not null,
   TaskID 	number(10,0) 	not null,
   constraint PK_LBTASKOBJECTREFS primary key (ID)
)
/

create table lbTaskPause (
   ID		number(10,0) 	not null,
   TaskID 	number(10,0) 	not null,
   PauseTime	date,
   RestartTime	date,
   constraint PK_LBTASKPAUSE primary key (ID)
)
/

create table lbTaskFavorite (
  TaskID	number(10,0)	NOT null ,
  UserID	number(10,0),	
  constraint PK_LBTASKFAVORITE primary key (TaskID,UserID)
)
/

CREATE TABLE lbTaskPredecessor (
  TaskID	numeric(10,0)	NOT NULL,
  PRE_TASKID	numeric(10,0)	NOT NULL,
  PRE_STATUS	numeric(2,0)	NOT NULL,
  constraint PK_LBTASKPREDECESSOR primary key (TASKID,PRE_TASKID)
)
/

create table lbTaskWorkflowRefs  (
   ID                 NUMBER(19,0)                    not null,
   InstId             NUMBER(19,0)                    not null,
   refInstId          NUMBER(19,0)                    not null,
   creatorId          NUMBER(19,0)                    not null,
   subject            VARCHAR2(1024),
   wfName             VARCHAR2(256),
   constraint PK_LBTASKWORKFLOWREFS primary key (ID)
)
/

create sequence S_DW_Step_Owner
/
create sequence S_DW_WFEntry
/
create sequence S_DW_Current_Step
/

CREATE  TABLE DW_Step_Owner (
  ID			NUMBER(16)		not null,
  Step_ID		NUMBER(16),
  Owner			VARCHAR2(30),
  constraint PK_DW_Step_Owner primary key (ID)
)
/

CREATE  TABLE DW_WFEntry (
  ID			NUMBER(16)	NOT NULL,
  Server_ID		VARCHAR2(30) NOT NULL ,
  Entry_ID		NUMBER(16) NOT NULL ,
  Name			VARCHAR2(30) NOT NULL ,
  Workflow_Name		VARCHAR2(30),
  Subject		VARCHAR2(30) NOT NULL ,
  State        		NUMBER(1) not null,
  Initiator		VARCHAR2(30),
  Initiator_Name	VARCHAR2(30),
  Init_Date		DATE,
  constraint PK_DW_WFEntry primary key (ID)
)
/ 

CREATE  TABLE DW_Current_Step (
  ID			NUMBER(16)	NOT NULL,
  Entry_ID		NUMBER(16) NOT NULL ,
  Step_ID		NUMBER(16) NOT NULL ,
  Step_NO		NUMBER(16) NOT NULL ,
  Step_Name		VARCHAR2(30),
  Start_Date		DATE,
  Finish_Date		DATE,
  Due_Date		DATE,
  Status        	VARCHAR2(30),
  Caller		VARCHAR2(30),
  Flag			NUMBER(1),
  constraint PK_DW_Current_Step primary key (ID)
)
/ 

CREATE  TABLE DW_History_Step (
  ID			NUMBER(16) NOT NULL ,
  Entry_ID		NUMBER(16) NOT NULL ,
  Step_ID		NUMBER(16) NOT NULL ,
  Step_NO		NUMBER(16) NOT NULL ,
  Step_Name		VARCHAR2(30),
  Start_Date		DATE,
  Finish_Date		DATE,
  Due_Date		DATE,
  Status        	VARCHAR2(30),
  Caller		VARCHAR2(30),
  Flag			NUMBER(1),
  constraint PK_DW_History_Step primary key (ID)
)
/

-- feed /提到我的
CREATE TABLE lbFeedMention (
   FeedID		NUMBER(12),
   FeedUserID		NUMBER(12),
   FeedType		NUMBER
)
/
alter table lbFeedMention
  add constraint lbFeedMention_PRI primary key (FeedID, FeedUserID, FeedType)
  using index 
/
create index lbFeedMention_idx on  lbFeedMention  (
	FeedUserID
)
/


create sequence S_lbAgileI18NResource
/
create sequence S_lbAgileWFEntryIDRef
/
create sequence S_lbAgileWFRTNofityInfo
/
create sequence S_lbAgileWFRTNotifyOwner
/
create sequence S_lbAgileWFRTReassignInfo
/
create sequence S_lbAgileWFRTStepProperty
/
create sequence S_lbAgileWFRuntimeCondition
/
create sequence S_lbAgileWFRuntimeManager
/
create sequence S_lbAgileWFRuntimeProp
/
create sequence S_lbAgileWFRuntimeVariable
/
create sequence S_lbAgileWFSchemeRTDef
/
create sequence S_lbAgileWFStepRTCondition
/
create sequence S_lbAgileWFStepRuntimeAction
/
create sequence S_lbAgileWFStepRuntimeColumn
/
create sequence S_lbAgileWFStepRuntimeCommand
/
create sequence S_lbAgileWFStepRuntimeFun
/
create sequence S_lbAgileWFStepTimeoutProcess
/
create sequence S_lbAgileWorkflowCategory
/
create sequence S_lbAgileWorkflowDef
/
create sequence S_lbAgileWorkflowIDMap
/
create sequence S_lbAgileWorkflowManager
/
create sequence S_lbHistoryAgileWorkflowDef
/
create sequence S_lbWFStepRuntimeOwner
/
create sequence S_AgileWorkflow start with 10000000
/

/*==============================================================*/
/* Table: "lbAgileI18NResource"                                 */
/*==============================================================*/
create table lbAgileI18NResource 
(
   ID                   NUMBER(6)            not null,
   workflowName         VARCHAR2(50)         not null,
   schemeName           VARCHAR2(50),
   resType              INTEGER              not null,
   keyName              VARCHAR2(200),
   lang                 VARCHAR2(100),
   value                VARCHAR2(1000)       not null,
   note                 VARCHAR2(1000),
   constraint PK_LBAGILEI18NRESOURCE primary key (ID)
)
/

/*==============================================================*/
/* Table: lbAgileAbnormalInstance                             */
/*==============================================================*/
create table lbAgileAbnormalInstance 
(
   ID                   NUMBER(16)           not null,
   InstID               INTEGER,
   StepID               INTEGER,
   TaskDate             DATE,
   Subject              VARCHAR2(60),
   Category             VARCHAR2(60),
   StepName             VARCHAR2(60),
   Initiator            VARCHAR2(12),
   InitDate             DATE,
   type                 INTEGER,
   state                INTEGER,
   startTime            DATE,
   WorkflowName         VARCHAR2(60),
   constraint PK_LBAGILEABNORMALINSTANCE primary key (ID)
)
/

/*==============================================================*/
/* Table: lbAgileManagerDetailInfo                            */
/*==============================================================*/
create table lbAgileManagerDetailInfo 
(
   ID                   NUMBER(16)           not null,
   InstID               INTEGER,
   managerId            VARCHAR2(20),
   executeTime          DATE,
   operate              INTEGER,
   constraint PK_LBAGILEMANAGERDETAILINFO primary key (ID)
)
/

/*==============================================================*/
/* Table: lbAgileWFEntryIDRef                                   */
/*==============================================================*/
create table lbAgileWFEntryIDRef 
(
   ID                   NUMBER(16)           not null,
   schemeRefId          NUMBER(16)           not null,
   descId               INTEGER              not null,
   prevDescId           INTEGER              not null,
   descIdType           SMALLINT             not null,
   constraint PK_LBAGILEWFENTRYIDREF primary key (ID)
)
/

comment on table lbAgileWFEntryIDRef is
'实例方案步骤、动作ID变更表'
/

/*==============================================================*/
/* Table: lbAgileWFEntrySchemeRef                               */
/*==============================================================*/
create table lbAgileWFEntrySchemeRef 
(
   ID                   NUMBER(16)           not null,
   instId               NUMBER(16)           not null,
   schemeId             NUMBER(16)           not null,
   prevSchemeId         NUMBER(16)           not null,
   constraint PK_LBAGILEWFENTRYSCHEMEREF primary key (ID)
)
/

comment on table lbAgileWFEntrySchemeRef is
'实例方案版本变更表'
/

/*==============================================================*/
/* Table: lbAgileWFManagedInfo                                */
/*==============================================================*/
create table lbAgileWFManagedInfo 
(
   ID                   NUMBER(16),
   workflowName         VARCHAR2(50),
   managerId            VARCHAR2(20),
   executeTime          DATE,
   operate              INTEGER
)
/

/*==============================================================*/
/* Table: lbAgileWFRTNofityInfo                               */
/*==============================================================*/
create table lbAgileWFRTNofityInfo 
(
   ID                   NUMBER(16)           not null,
   stepId               INTEGER,
   message              VARCHAR2(1024),
   constraint PK_LBAGILEWFRTNOFITYINFO primary key (ID)
)
/

/*==============================================================*/
/* Table: lbAgileWFRTNotifyOwner                              */
/*==============================================================*/
create table lbAgileWFRTNotifyOwner 
(
   ID                   NUMBER(16)           not null,
   stepId               INTEGER,
   ownerCategory        INTEGER,
   type                 INTEGER,
   ownerDescribe        VARCHAR2(50),
   args                 VARCHAR2(1024),
   expression           VARCHAR2(1024),
   constraint PK_LBAGILEWFRTNOTIFYOWNER primary key (ID)
)
/

/*==============================================================*/
/* Table: lbAgileWFRTReassignInfo                             */
/*==============================================================*/
create table lbAgileWFRTReassignInfo 
(
   ID                   NUMBER(16)           not null,
   entryId              INTEGER,
   inputStepId          INTEGER,
   targetStepId         INTEGER,
   assignedBy           VARCHAR2(20),
   assignedTo           VARCHAR2(20),
   FDNCodes             VARCHAR2(100),
   constraint PK_LBAGILEWFRTREASSIGNINFO primary key (ID)
)
/

/*==============================================================*/
/* Table: lbAgileWFRTStepProperty                             */
/*==============================================================*/
create table lbAgileWFRTStepProperty 
(
   ID                   NUMBER(16)           not null,
   stepId               INTEGER,
   type                 INTEGER,
   value                VARCHAR2(255),
   constraint PK_LBAGILEWFRTSTEPPROPERTY primary key (ID)
)
/
comment on table lbAgileWFRTStepProperty is
'活动属性'
/

/*==============================================================*/
/* Table: lbAgileWFRuntimeBaseInfo                            */
/*==============================================================*/
create table lbAgileWFRuntimeBaseInfo 
(
   ID                   NUMBER(16)           not null,
   workflowName         VARCHAR2(50),
   describe             VARCHAR2(50),
   category             VARCHAR2(50),
   objectName           VARCHAR2(50),
   constraint PK_LBAGILEWFRUNTIMEBASEINFO primary key (ID)
)
/

/*==============================================================*/
/* Table: lbAgileWFRuntimeCondition                           */
/*==============================================================*/
create table lbAgileWFRuntimeCondition 
(
   ID                   NUMBER(16)           not null,
   schemeId             INTEGER,
   name                 VARCHAR2(50),
   describe             VARCHAR2(50),
   type                 INTEGER,
   expression           VARCHAR2(1024),
   constraint PK_LBAGILEWFRUNTIMECONDITION primary key (ID)
)
/
comment on table lbAgileWFRuntimeCondition is
'流程方案适用条件'
/

/*==============================================================*/
/* Table: lbAgileWFRuntimeManager                             */
/*==============================================================*/
create table lbAgileWFRuntimeManager 
(
   ID                   NUMBER(16)           not null,
   workflowId           INTEGER,
   args                 VARCHAR2(1024),
   type                 INTEGER,
   ownerDescribe        VARCHAR2(50),
   expression           VARCHAR2(1024),
   constraint PK_LBAGILEWFRUNTIMEMANAGER primary key (ID)
)
/

/*==============================================================*/
/* Table: lbAgileWFRuntimeProp                                */
/*==============================================================*/
create table lbAgileWFRuntimeProp 
(
   ID                   NUMBER(16)           not null,
   schemeId             INTEGER,
   type                 INTEGER,
   value                VARCHAR2(50),
   constraint PK_LBAGILEWFRUNTIMEPROP primary key (ID)
)
/

/*==============================================================*/
/* Table: lbAgileWFRuntimeStep                                */
/*==============================================================*/
create table lbAgileWFRuntimeStep 
(
   ID                   NUMBER(16)           not null,
   schemeId             INTEGER,
   stepId               INTEGER,
   name                 VARCHAR2(30),
   type                 INTEGER,
   objectName           VARCHAR2(50),
   creator              number(16),
   constraint PK_LBAGILEWFRUNTIMESTEP primary key (ID)
)
/
comment on table lbAgileWFRuntimeStep is
'敏捷流程节点信息'
/

/*==============================================================*/
/* Table: lbAgileWFRuntimeVariable                            */
/*==============================================================*/
create table lbAgileWFRuntimeVariable 
(
   ID                   NUMBER(16)           not null,
   schemeId             INTEGER,
   varName              VARCHAR2(50),
   varDescribe          VARCHAR2(50),
   varType              VARCHAR2(20),
   varValue             VARCHAR2(300),
   varScope             INTEGER,
   constraint PK_LBAGILEWFRUNTIMEVARIABLE primary key (ID)
)
/

/*==============================================================*/
/* Table: lbAgileWFSchemeRTDef                                  */
/*==============================================================*/
create table lbAgileWFSchemeRTDef 
(
   ID                   NUMBER(16)           not null,
   workflowName         VARCHAR2(50),
   schemeName           VARCHAR2(50),
   describe             VARCHAR2(50),
   schemeType           INTEGER,
   note                 VARCHAR2(1024),
   category             VARCHAR2(200),
   categoryId           NUMBER(16),
   creator              number(16),
   constraint PK_LBAGILEWFSCHEMERTDEF primary key (ID)
)
/
comment on table lbAgileWFSchemeRTDef is
'原敏捷流程定义表改为自由流程方案定义表'
/

/*==============================================================*/
/* Table: lbAgileWFStepRTCondition                            */
/*==============================================================*/
create table lbAgileWFStepRTCondition 
(
   ID                   NUMBER(16)           not null,
   stepId               INTEGER,
   type                 INTEGER,
   name                 VARCHAR2(50),
   describe             VARCHAR2(50),
   expression           VARCHAR2(1024),
   constraint PK_LBAGILEWFSTEPRTCONDITION primary key (ID)
)
/
comment on table lbAgileWFStepRTCondition is
'条件定义'
/

/*==============================================================*/
/* Table: lbAgileWFStepRuntimeAction                          */
/*==============================================================*/
create table lbAgileWFStepRuntimeAction 
(
   ID                   NUMBER(16)           not null,
   stepId               INTEGER,
   actionId             INTEGER,
   type                 INTEGER,
   alias                VARCHAR2(50),
   message              VARCHAR2(1024),
   constraint PK_LBAGILEWFSTEPRUNTIMEACTION primary key (ID)
)
/

/*==============================================================*/
/* Table: lbAgileWFStepRuntimeColumn                          */
/*==============================================================*/
create table lbAgileWFStepRuntimeColumn 
(
   ID                   NUMBER(16)           not null,
   stepId               INTEGER,
   name                 VARCHAR2(50),
   type                 INTEGER,
   isVisible            SMALLINT,
   isDisable            SMALLINT,
   isSummary            SMALLINT,
   objectName           VARCHAR2(50),
   refObject            VARCHAR2(120),
   editAttribute        VARCHAR2(10),
   constraint PK_LBAGILEWFSTEPRUNTIMECOLUMN primary key (ID)
)
/
comment on column lbAgileWFStepRuntimeColumn.editAttribute is
'？多少长度？'
/

/*==============================================================*/
/* Table: lbAgileWFStepRuntimeCommand                           */
/*==============================================================*/
create table lbAgileWFStepRuntimeCommand 
(
   ID                   NUMBER(16)           not null,
   stepId               INTEGER,
   name                 VARCHAR2(256),
   authMode             SMALLINT,
   constraint PK_LBAGILEWFSTEPRUNTIMECOMMAND primary key (ID)
)
/

/*==============================================================*/
/* Table: lbAgileWFStepRuntimeFun                             */
/*==============================================================*/
create table lbAgileWFStepRuntimeFun 
(
   ID                   NUMBER(16)           not null,
   stepId               INTEGER,
   functionName         VARCHAR2(50),
   supportActions       VARCHAR2(200),
   args                 VARCHAR2(1024),
   constraint PK_LBAGILEWFSTEPRUNTIMEFUN primary key (ID)
)
/
comment on table lbAgileWFStepRuntimeFun is
'流程活动节点执行的方法定义'
/

/*==============================================================*/
/* Table: lbAgileWFStepTimeoutProcess                         */
/*==============================================================*/
create table lbAgileWFStepTimeoutProcess 
(
   ID                   NUMBER(16)           not null,
   stepId               INTEGER,
   offset               NUMBER(12,1),
   processType          INTEGER,
   constraint PK_LBAGILEWFSTEPTIMEOUTPROCESS primary key (ID)
)
/

/*==============================================================*/
/* Table: lbAgileWorkflowCategory                               */
/*==============================================================*/
create table lbAgileWorkflowCategory 
(
   ID                   NUMBER(16)           not null,
   FID                  number(12),
   Grade                number(12),
   Type                 number(12),
   Name                 varchar2(200),
   FDNCode              varchar2(300),
   constraint PK_LBAGILEWORKFLOWCATEGORY primary key (ID)
)
/

/*==============================================================*/
/* Table: lbAgileWorkflowDef                                  */
/*==============================================================*/
create table lbAgileWorkflowDef 
(
   ID                   NUMBER(16)           not null,
   workflowName         VARCHAR2(50),
   schemeName           VARCHAR2(50),
   describe             VARCHAR2(50),
   objectName           VARCHAR2(50),
   schemeType           INTEGER,
   status               INTEGER,
   definition           CLOB,
   category             VARCHAR2(200),
   categoryId           NUMBER(16),
   creator              number(16),
   constraint PK_LBAGILEWORKFLOWDEF primary key (ID)
)
/

/*==============================================================*/
/* Table: lbAgileWorkflowIDMap                                  */
/*==============================================================*/
create table lbAgileWorkflowIDMap 
(
   ID                   number(16)           not null,
   workflowName         varchar2(20)         not null,
   schemeName           varchar2(50)         not null,
   designerId           INTEGER              not null,
   idType               smallint             not null,
   runtimeId            INTEGER              not null,
   constraint PK_LBAGILEWORKFLOWIDMAP primary key (ID)
)
/
comment on table lbAgileWorkflowIDMap is
'定义期、运行期的id序列对应表'
/

/*==============================================================*/
/* Table: lbAgileWorkflowManager                              */
/*==============================================================*/
create table lbAgileWorkflowManager 
(
   ID                   NUMBER(16)           not null,
   workflowName         VARCHAR2(50),
   type                 INTEGER,
   expression           VARCHAR2(1024),
   args                 VARCHAR2(1024),
   managerDescribe      VARCHAR2(50),
   operate              NUMBER(19),
   managerType          SMALLINT,
   schemeName           varchar2(50),
   constraint PK_LBAGILEWORKFLOWMANAGER primary key (ID)
)
/
comment on table lbAgileWorkflowManager is
'仅用于数据查询方便，如果查询具体管理员下所管理的流程信息'
/

/*==============================================================*/
/* Table: lbAgileWorkflowRuntimeDef                           */
/*==============================================================*/
create table lbAgileWorkflowRuntimeDef 
(
   ID                   NUMBER               not null,
   workflowName         VARCHAR2(50),
   status               INTEGER,
   version              INTEGER,
   runtimeVersion       INTEGER,
   schemeId             NUMBER(16),
   schemeRefType        SMALLINT,
   constraint PK_LBAGILEWORKFLOWRUNTIMEDEF primary key (ID)
)
/
comment on table lbAgileWorkflowRuntimeDef is
'原敏捷流程定义 新建表时应注意设置这个表ID序列初始值 status字段初始改成WORKFLOW_STATUS_NORMAL'
/
comment on column lbAgileWorkflowRuntimeDef.schemeId is
'指向lbAgileWFSchemeRTDEF'
/
comment on column lbAgileWorkflowRuntimeDef.schemeRefType is
'1: 标记为此流程版本作废的方案'
/

/*==============================================================*/
/* Table: lbHistoryAgileWorkflowDef                           */
/*==============================================================*/
create table lbHistoryAgileWorkflowDef 
(
   ID                   NUMBER(16)           not null,
   workflowName         VARCHAR2(50),
   schemeName           VARCHAR2(50),
   describe             VARCHAR2(50),
   objectName           VARCHAR2(50),
   schemeType           INTEGER,
   status               INTEGER,
   definition           CLOB,
   version              INTEGER,
   category             VARCHAR2(200),
   categoryId           NUMBER(16),
   creator              number(16),
   constraint PK_LBHISTORYAGILEWORKFLOWDEF primary key (ID)
)
/

/*==============================================================*/
/* Table: lbWFStepRuntimeOwner                                */
/*==============================================================*/
create table lbWFStepRuntimeOwner 
(
   ID                   NUMBER(16)           not null,
   stepId               INTEGER,
   args                 VARCHAR2(1024),
   type                 INTEGER,
   ownerDescribe        VARCHAR2(50),
   expression           VARCHAR2(1024),
   constraint PK_LBWFSTEPRUNTIMEOWNER primary key (ID)
)
/

alter table lbAgileWFEntryIDRef
   add constraint FK_AGILE_ENTRY_SCH_REF_DESCID foreign key (schemeRefId)
      references lbAgileWFEntrySchemeRef (ID)
/

alter table lbAgileWorkflowRuntimeDef
   add constraint FK_AGILE_WORK_REF_SCHEME foreign key (schemeId)
      references lbAgileWFSchemeRTDef (ID)
/

alter table lbAgileWorkflowIDMap
  add constraint AgileWorkflowIDMap_designer unique(workflowName,schemeName,designerId)
/

create unique index index_AgileWorkflowRuntimeDef on lbAgileWorkflowRuntimeDef
(workflowName,runtimeVersion,schemeId)
/

create unique index index_AgileWFSchemeRTDef on lbAgileWFSchemeRTDef
(schemeType,ID)
/

create table lbAgileWFSchRuntimePanel
(
   ID                 NUMBER(16)           not null,
   schemeId           INTEGER,
   name               VARCHAR2(256),
   primary key (ID)
)
/
create sequence S_lbAgileWFSchRuntimePanel
/

create table lbAgileWFStepRuntimePanel
(
   ID                 NUMBER(16)           not null,
   stepId             INTEGER,
   name               VARCHAR2(256),
   primary key (ID)
)
/
create sequence S_lbAgileWFStepRuntimePanel
/

create table lbWorkflowProperty (
  ID		numeric(16)	not null,
  InstId	numeric(16,0),
  StepDescID	numeric(9,0), --步骤描述ID
  StepID	numeric(16,0), -- 实际步骤ID
  Type		smallint	not null,
  Caller	varchar2(20),
  StringValue	varchar2(1024),
  NumberValue	numeric(18,0)
)
/

/*==============================================================*/
/* Table: lbWorkflowRels    modify,工作流相关流程,表结构变更,linym,2013-01-24*/
/*==============================================================*/
create table lbWorkflowRefs (
   ID                   numeric(19,0)        not null,
   InstId               numeric(19,0)        not null,
   refInstId            numeric(19,0)        not null,
   creatorId            numeric(19,0)        not null,
   subject              varchar2(1024)       null,
   wfName               varchar2(256)        null
)
/
alter table lbWorkflowRefs 
  add constraint PK_lbWorkflowRefs primary key (ID)
/

--流程管理中心整合
create table lbWorkflowDefsDesign
(
   name               VARCHAR2(255)        not null,
   definition         CLOB,
   describe           VARCHAR2(256),
   layout             CLOB,
   category           VARCHAR2(200),
   attribute          INTEGER,
   type               INTEGER,
   status             SMALLINT,
   primary key (name)
)
/
create table lbHistoryWorkflowDefsDesign
(
   name               VARCHAR2(255)        not null,
   definition         CLOB,
   describe           VARCHAR2(256),
   layout             CLOB,
   category           VARCHAR2(200),
   attribute          INTEGER,
   type               INTEGER,
   version            INTEGER              not null,
   status             SMALLINT,
   primary key (name, version)
)
/
create table lbWorkOwnerParamDesign
(
   ID                   NUMBER(16)           not null,
   workflowName       VARCHAR2(300),
   varName            VARCHAR2(30),
   varValue           VARCHAR2(300),
   primary key (ID)
)
/

create table lbHisWorkOwnerParamDesign
(
   ID                 NUMBER(16)           not null,
   workflowName       VARCHAR2(300),
   version            NUMBER(12),
   varName            VARCHAR2(30),
   varValue           VARCHAR2(300),
   primary key (ID)
)
/
create table lbWorkVariableDesign 
(
   ID                 NUMBER(16)           not null,
   workflowName       VARCHAR2(300),
   varName            VARCHAR2(30),
   varValue           VARCHAR2(300)
)
/

create table lbHistoryWorkVariableDesign 
(
   ID                 NUMBER(16)           not null,
   workflowName       VARCHAR2(300),
   version            NUMBER(12),
   varName            VARCHAR2(30),
   varValue           VARCHAR2(300)
)
/
create sequence S_lbHistoryWorkflowDefsDesign
/
create sequence S_lbWorkOwnerParamDesign
/
create sequence S_lbHisWorkOwnerParamDesign
/
create sequence S_lbWorkVariableDesign
/
create sequence S_lbHistoryWorkVariableDesign
/

create sequence S_lbFunAuthDetailLog
/
create table lbFunAuthDetailLog
(
   ID                 INTEGER              not null,
   Auth_ID            INTEGER              not null,
   FunName            VARCHAR2(60)         not null,
   StartDate          DATE,
   EndDate            DATE,
   AuditFlag	      smallint		   null
)
/
create sequence S_lbFunScopeAuthDetailLog
/
create table lbFunScopeAuthDetailLog
(
   ID                 INTEGER              not null,
   Auth_ID            INTEGER              not null,
   FunName            VARCHAR2(60)         not null,
   AuditFlag          SMALLINT
)
/
create sequence S_lbRoleAuthDetailLog
/
create table lbRoleAuthDetailLog
(
   ID                 INTEGER              not null,
   Auth_ID            INTEGER              not null,
   RoleID             INTEGER,
   AuditFlag          SMALLINT
)
/
create sequence S_lbRoleScopeAuthDetailLog
/
create table lbRoleScopeAuthDetailLog
(
   ID                 INTEGER              not null,
   Auth_ID            INTEGER              not null,
   RoleID             INTEGER,
   AuditFlag          SMALLINT
)
/
create sequence S_lbDataScopeAuthDetailLog
/
create table lbDataScopeAuthDetailLog
(
   ID                 NUMBER(6)            not null,
   Auth_ID            INTEGER              not null,
   FactorName         VARCHAR2(60)         not null,
   ScopeExp           VARCHAR2(1024)       not null,
   AuditFlag          SMALLINT
)
/
create sequence S_lbColumnAuthDetailLog
/
create table lbColumnAuthDetailLog
(
   ID                 INTEGER              not null,
   Auth_ID            INTEGER              not null,
   AuthOperate        VARCHAR2(30)         not null,
   PowerType          SMALLINT             not null,
   ObjName            VARCHAR2(200)        not null,
   ColName            VARCHAR2(200)        not null,
   Permission         INTEGER              not null,
   AuditFlag          SMALLINT
)
/
create sequence S_lbRoleCatScopeDetailLog
/
create table lbRoleCatScopeDetailLog
(
   ID                 INTEGER              not null,
   Auth_ID            INTEGER              not null,
   RoleCategory       INTEGER              not null,
   AuditFlag          SMALLINT
)
/
create sequence S_lbObjAuthDetailLog
/
create table lbObjAuthDetailLog
(
   ID                 INTEGER              not null,
   Auth_ID            INTEGER              not null,
   Tablename          VARCHAR2(256)        not null,
   Operate            NUMBER(9),
   CustomOper         VARCHAR2(256),
   AuditFlag          SMALLINT
)
/
create sequence S_lbObjAuthScopeDetailLog
/
create table lbObjAuthScopeDetailLog
(
   ID                 INTEGER              not null,
   Auth_ID            INTEGER              not null,
   Tablename          VARCHAR2(256)        not null,
   Operate            NUMBER(9),
   CustomOper         VARCHAR2(256),
   AuditFlag          SMALLINT
)
/
create sequence S_lbAuthDuplicateLog
/
create table lbAuthDuplicateLog
(
   ID                 INTEGER,
   Auth_iD            INTEGER,
   Type               INTEGER,
   MemberID           INTEGER
)
/


create or replace function FUNC_NEXTID
(tablename in varchar2) return number is
--v1.0.2 8解决此过程并发时可能产生相同id问题
--pragma autonomous_transaction;
  nextid number(12);
begin

  begin
    select nvl(max(id),-1) into nextid from tSequence where upper(name) = upper(tablename);
  exception
    when no_data_found then nextid := 0;
   -- commit;
  end;
  if nextid = -1 then
    INSERT INTO tsequence(name,id) VALUES(tablename,1);
    nextid := 1;
  else
    --v1.0.2 update之后本记录处于锁定状态，这样并发时也不会出现相同ID
	  update tSequence set id = id+1 where upper(name) = upper(tablename);
    select nvl(max(id),-1) into nextid from tSequence where upper(name) = upper(tablename);
  end if;

  return(nextid);
end FUNC_NEXTID;
/

--汉字获取拼音
CREATE OR REPLACE FUNCTION lbFunPinyin(P_NAME IN VARCHAR2) RETURN VARCHAR2 AS
   V_COMPARE VARCHAR2(100);
   V_RETURN VARCHAR2(4000);
   V_CH VARCHAR2(2);
FUNCTION F_NLSSORT(P_WORD IN VARCHAR2) RETURN VARCHAR2 AS
BEGIN
    RETURN NLSSORT(P_WORD, 'NLS_SORT=SCHINESE_PINYIN_M');
END;
BEGIN
    IF(P_NAME IS NULL) THEN
        RETURN NULL;
    END IF;
    FOR I IN 1..LENGTH(P_NAME) LOOP
        V_CH := SUBSTR(P_NAME, I, 1);
        V_COMPARE := F_NLSSORT(V_CH);
      IF V_COMPARE >= F_NLSSORT('吖') AND V_COMPARE <= F_NLSSORT('驁') THEN
          V_RETURN := V_RETURN || 'A';
      ELSIF V_COMPARE >= F_NLSSORT('八') AND V_COMPARE <= F_NLSSORT('簿') THEN
          V_RETURN := V_RETURN || 'B';
      ELSIF V_COMPARE >= F_NLSSORT('嚓') AND V_COMPARE <= F_NLSSORT('錯') THEN
          V_RETURN := V_RETURN || 'C';
      ELSIF V_COMPARE >= F_NLSSORT('咑') AND V_COMPARE <= F_NLSSORT('鵽') THEN
          V_RETURN := V_RETURN || 'D';
      ELSIF V_COMPARE >= F_NLSSORT('妸') AND V_COMPARE <= F_NLSSORT('樲') THEN
          V_RETURN := V_RETURN || 'E';
      ELSIF V_COMPARE >= F_NLSSORT('发') AND V_COMPARE <= F_NLSSORT('猤') THEN
          V_RETURN := V_RETURN || 'F';
      ELSIF V_COMPARE >= F_NLSSORT('旮') AND V_COMPARE <= F_NLSSORT('腂') THEN
          V_RETURN := V_RETURN || 'G';
      ELSIF V_COMPARE >= F_NLSSORT('妎') AND V_COMPARE <= F_NLSSORT('夻') THEN
          V_RETURN := V_RETURN || 'H';
      ELSIF V_COMPARE >= F_NLSSORT('丌') AND V_COMPARE <= F_NLSSORT('攈') THEN
          V_RETURN := V_RETURN || 'J';
      ELSIF V_COMPARE >= F_NLSSORT('咔') AND V_COMPARE <= F_NLSSORT('穒') THEN
          V_RETURN := V_RETURN || 'K';
      ELSIF V_COMPARE >= F_NLSSORT('垃') AND V_COMPARE <= F_NLSSORT('擽') THEN
          V_RETURN := V_RETURN || 'L';
      ELSIF V_COMPARE >= F_NLSSORT('嘸') AND V_COMPARE <= F_NLSSORT('椧') THEN
          V_RETURN := V_RETURN || 'M';
      ELSIF V_COMPARE >= F_NLSSORT('拏') AND V_COMPARE <= F_NLSSORT('瘧') THEN
          V_RETURN := V_RETURN || 'N';
      ELSIF V_COMPARE >= F_NLSSORT('筽') AND V_COMPARE <= F_NLSSORT('漚') THEN
          V_RETURN := V_RETURN || 'O';
      ELSIF V_COMPARE >= F_NLSSORT('妑') AND V_COMPARE <= F_NLSSORT('曝') THEN
          V_RETURN := V_RETURN || 'P';
      ELSIF V_COMPARE >= F_NLSSORT('七') AND V_COMPARE <= F_NLSSORT('裠') THEN
          V_RETURN := V_RETURN || 'Q';
      ELSIF V_COMPARE >= F_NLSSORT('亽') AND V_COMPARE <= F_NLSSORT('鶸') THEN
          V_RETURN := V_RETURN || 'R';
      ELSIF V_COMPARE >= F_NLSSORT('仨') AND V_COMPARE <= F_NLSSORT('蜶') THEN
          V_RETURN := V_RETURN || 'S';
      ELSIF V_COMPARE >= F_NLSSORT('侤') AND V_COMPARE <= F_NLSSORT('籜') THEN
          V_RETURN := V_RETURN || 'T';
      ELSIF V_COMPARE >= F_NLSSORT('屲') AND V_COMPARE <= F_NLSSORT('鶩') THEN
          V_RETURN := V_RETURN || 'W';
      ELSIF V_COMPARE >= F_NLSSORT('夕') AND V_COMPARE <= F_NLSSORT('鑂') THEN
          V_RETURN := V_RETURN || 'X';
      ELSIF V_COMPARE >= F_NLSSORT('丫') AND V_COMPARE <= F_NLSSORT('韻') THEN
          V_RETURN := V_RETURN || 'Y';
      ELSIF V_COMPARE >= F_NLSSORT('帀') AND V_COMPARE <= F_NLSSORT('咗') THEN
          V_RETURN := V_RETURN || 'Z';
      ELSE
          V_RETURN := V_RETURN || V_CH;
      END IF;
    END LOOP;
    RETURN V_RETURN;
END;
/

/**
 * 添加消息提醒脚本
 */
create sequence S_LBNOTIFICATIONOPERATES
minvalue 1
maxvalue 999999999999999
start with 21
increment by 1
cache 20
/
 
create sequence S_LBNOTIFICATIONUSER
minvalue 1
maxvalue 9999999999999999
start with 21
increment by 1
cache 20
/

create table LBNOTIFICATIONUSER
(
  ID             INTEGER not null,
  NOTIFICATIONID INTEGER not null,
  USERID         INTEGER not null,
  ISREAD         INTEGER default 0 not null,
  READTIME       DATE
)
/
 alter table lbNotificationUser
  add constraint PK_lbNotificationUser primary key (ID)
/

create table LBNOTIFICATIONOPERATES
(
  ID             INTEGER not null,
  NOTIFICATIONID INTEGER not null,
  OPERATENAME    VARCHAR2(500) not null,
  OPERATEKEY     VARCHAR2(500) not null,
  OPERATEVALUE   VARCHAR2(1000)
)
/
 alter table lbNotificationOperates
  add constraint PK_lbNotificationOperates primary key (ID)
/

create table LBNOTIFICATIONOBJECTOPERATE
(
  TABLENAME   VARCHAR2(50) not null,
  OPERATENAME VARCHAR2(100) not null,
  OPERATE     VARCHAR2(50) not null
)
/
 alter table lbNotificationObjectOperate
  add constraint PK_lbNotificationObjectOperate primary key (TABLENAME)
/

create table LBNOTIFICATIONOBJECT
(
  TABLENAME	VARCHAR2(100) not null,
  DESCRIBE	VARCHAR2(100) not null,
  PRIORITY	INTEGER,
  CUSTOMPATH	VARCHAR2(100),
  ICON		VARCHAR2(50),
  READTYPE	INTEGER,
  UIMODE	VARCHAR2(30),
  ListenerType  INTEGER,
  IsListener	INTEGER,
  ContentType	VARCHAR2(10),
  DisplayType	VARCHAR2(10),
  SendHistory	INTEGER,
  Receiver	VARCHAR2(255),
  NoticeType	int,
  ChannelType	varchar2(100)
)
/
 alter table lbNotificationObject
  add constraint PK_lbNotificationObject primary key (TABLENAME)
/

create table LBNOTIFICATION
(
  ID          INTEGER not null,
  OBJID       VARCHAR2(100) null,
  TYPE        VARCHAR2(100) not null,
  TITLE       VARCHAR2(1000),
  CONTENT     VARCHAR2(1000),
  SENDUSER    INTEGER,
  SENDTIME    VARCHAR2(20) not null,
  ISREVOKED   INTEGER default 0 not null,
  REVOKEDTIME DATE,
  ISDEL       INTEGER default 0 not null,
  DELTIME     DATE
)
/
 alter table lbNotification
  add constraint PK_lbNotification primary key (ID)
/

CREATE TABLE lbNotificationParams (
  ID		int  NOT NULL,
  NotificationID int NOT NULL,
  ParamKey	varchar2(500)	NOT NULL,
  ParamValue	varchar2(1000)  NOT NULL,
constraint PK_lbNotificationParams primary key(ID)
)
/
create sequence S_lbNotificationParams
/

CREATE TABLE  LBNOTIFICATIONPARAMS_HIS  (
   N_ID		numeric(19, 0)	NOT NULL,
   RECV_UID	numeric(19, 0)	NOT NULL,
   PARAMKEY	varchar(500)	NOT NULL,
   PARAMVALUE	varchar(1000)   NOT NULL,
   primary key (N_ID)
)
/

CREATE TABLE LBNOTIFICATIONOPERATES_HIS (
  N_ID		numeric(19, 0)	NOT NULL,
  RECV_UID	numeric(19, 0)	NOT NULL,
  OPERATENAME	varchar(500)	NOT NULL,
  OPERATEKEY	varchar(500)	NOT NULL,
  OPERATEVALUE	varchar(1000)	NOT NULL,
  primary key (N_ID)
)
/

CREATE TABLE  LBNOTIFICATION_HIS  (
  N_ID		numeric(19, 0)	NOT NULL,
  RECV_UID	numeric(19, 0)	NOT NULL,
  N_OBJID	varchar(100)	NULL,
  N_TYPE	varchar(100)	NOT NULL,
  N_TITLE	varchar(500)	NOT NULL,
  N_CONTENT	varchar(1000)   NOT NULL,
  N_SENDUSER	int		NULL,
  N_SENDTIME	date		NOT NULL,
  N_ISREVOKED	int  DEFAULT 0	NOT NULL,
  N_REVOKEDTIME date		NULL,
  N_ISDEL int	DEFAULT 0	NOT NULL,
  N_DELTIME	date		NULL,
  primary key (N_ID)
)
/

CREATE  TABLE lbWorkCalendar (
  ID                  NUMBER(16) not null,
  Calendar            DATE NOT NULL ,
  Locale              VARCHAR2(10) NOT NULL ,
  isHoliday           NUMBER(1,0) not null
)
/
 alter table lbWorkCalendar
  add constraint PK_lbWorkCalendar primary key (ID)
/
create sequence S_lbWorkCalendar
minvalue 1
maxvalue 999999999999999
start with 1
increment by 1
cache 20
/