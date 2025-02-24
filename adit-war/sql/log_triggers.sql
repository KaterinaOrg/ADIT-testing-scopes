CREATE OR REPLACE TRIGGER &&ADIT_SCHEMA..TR_ACCESS_RESTRICTION_LOG
  after insert or update or delete
  on &&ADIT_SCHEMA..ACCESS_RESTRICTION referencing old as old new as new
  for each row
DECLARE
  operation varchar2(100);
  ACCESS_RESTRICTION_new &&ADIT_SCHEMA..ACCESS_RESTRICTION%ROWTYPE;
  ACCESS_RESTRICTION_old &&ADIT_SCHEMA..ACCESS_RESTRICTION%ROWTYPE;
BEGIN

  if inserting then
    operation := 'INSERT';
  else
    if updating then
      operation := 'UPDATE';
    else
      operation := 'DELETE';
    end if;
  end if;

  ACCESS_RESTRICTION_new.ID := :new.ID;
  ACCESS_RESTRICTION_new.REMOTE_APPLICATION := :new.REMOTE_APPLICATION;
  ACCESS_RESTRICTION_new.USER_CODE := :new.USER_CODE;
  ACCESS_RESTRICTION_new.RESTRICTION := :new.RESTRICTION;
  
  ACCESS_RESTRICTION_old.ID := :old.ID;
  ACCESS_RESTRICTION_old.REMOTE_APPLICATION := :old.REMOTE_APPLICATION;
  ACCESS_RESTRICTION_old.USER_CODE := :old.USER_CODE;
  ACCESS_RESTRICTION_old.RESTRICTION := :old.RESTRICTION;

  &&ADIT_SCHEMA..ADITLOG.LOG_ACCESS_RESTRICTION(
    ACCESS_RESTRICTION_new,
    ACCESS_RESTRICTION_old,
    operation
  );

END;
/

CREATE OR REPLACE TRIGGER &&ADIT_SCHEMA..TR_ADIT_USER_LOG
  after insert or update or delete
  on &&ADIT_SCHEMA..ADIT_USER referencing old as old new as new
  for each row
DECLARE
  operation varchar2(100);
  ADIT_USER_new &&ADIT_SCHEMA..ADIT_USER%ROWTYPE;
  ADIT_USER_old &&ADIT_SCHEMA..ADIT_USER%ROWTYPE;
BEGIN

  if inserting then
    operation := 'INSERT';
  else
    if updating then
      operation := 'UPDATE';
    else
      operation := 'DELETE';
    end if;
  end if;
  
  ADIT_USER_new.USER_CODE := :new.USER_CODE;
  ADIT_USER_new.FULL_NAME := :new.FULL_NAME;
  ADIT_USER_new.USERTYPE := :new.USERTYPE;
  ADIT_USER_new.ACTIVE := :new.ACTIVE;
  ADIT_USER_new.DVK_ORG_CODE := :new.DVK_ORG_CODE;
  ADIT_USER_new.DVK_SUBDIVISION_SHORT_NAME := :new.DVK_SUBDIVISION_SHORT_NAME;
  ADIT_USER_new.DVK_OCCUPATION_SHORT_NAME := :new.DVK_OCCUPATION_SHORT_NAME;
  ADIT_USER_new.DISK_QUOTA := :new.DISK_QUOTA;
  ADIT_USER_new.DEACTIVATION_DATE := :new.DEACTIVATION_DATE;
  
  ADIT_USER_old.USER_CODE := :old.USER_CODE;
  ADIT_USER_old.FULL_NAME := :old.FULL_NAME;
  ADIT_USER_old.USERTYPE := :old.USERTYPE;
  ADIT_USER_old.ACTIVE := :old.ACTIVE;
  ADIT_USER_old.DVK_ORG_CODE := :old.DVK_ORG_CODE;
  ADIT_USER_old.DVK_SUBDIVISION_SHORT_NAME := :old.DVK_SUBDIVISION_SHORT_NAME;
  ADIT_USER_old.DVK_OCCUPATION_SHORT_NAME := :old.DVK_OCCUPATION_SHORT_NAME;
  ADIT_USER_old.DISK_QUOTA := :old.DISK_QUOTA;
  ADIT_USER_old.DEACTIVATION_DATE := :old.DEACTIVATION_DATE;

  &&ADIT_SCHEMA..ADITLOG.LOG_ADIT_USER(
    ADIT_USER_new,
    ADIT_USER_old,
    operation
  );

END;
/

CREATE OR REPLACE TRIGGER &&ADIT_SCHEMA..TR_DOCUMENT_LOG
  after insert or update or delete
  on &&ADIT_SCHEMA..DOCUMENT referencing old as old new as new
  for each row
DECLARE
  operation varchar2(100);
  DOCUMENT_new &&ADIT_SCHEMA..DOCUMENT%ROWTYPE;
  DOCUMENT_old &&ADIT_SCHEMA..DOCUMENT%ROWTYPE;
BEGIN

  if inserting then
    operation := 'INSERT';
  else
    if updating then
      operation := 'UPDATE';
    else
      operation := 'DELETE';
    end if;
  end if;

  DOCUMENT_new.ID := :new.ID;
  DOCUMENT_new.GUID := :new.GUID;
  DOCUMENT_new.TITLE := :new.TITLE;
  DOCUMENT_new.TYPE := :new.TYPE;
  DOCUMENT_new.CREATOR_CODE := :new.CREATOR_CODE;
  DOCUMENT_new.CREATOR_NAME := :new.CREATOR_NAME;
  DOCUMENT_new.CREATOR_USER_CODE := :new.CREATOR_USER_CODE;
  DOCUMENT_new.CREATOR_USER_NAME := :new.CREATOR_USER_NAME;
  DOCUMENT_new.CREATION_DATE := :new.CREATION_DATE;
  DOCUMENT_new.REMOTE_APPLICATION := :new.REMOTE_APPLICATION;
  DOCUMENT_new.LAST_MODIFIED_DATE := :new.LAST_MODIFIED_DATE;
  DOCUMENT_new.DOCUMENT_DVK_STATUS_ID := :new.DOCUMENT_DVK_STATUS_ID;
  DOCUMENT_new.DVK_ID := :new.DVK_ID;
  DOCUMENT_new.DOCUMENT_WF_STATUS_ID := :new.DOCUMENT_WF_STATUS_ID;
  DOCUMENT_new.PARENT_ID := :new.PARENT_ID;
  DOCUMENT_new.LOCKED := :new.LOCKED;
  DOCUMENT_new.LOCKING_DATE := :new.LOCKING_DATE;
  DOCUMENT_new.SIGNABLE := :new.SIGNABLE;
  DOCUMENT_new.DEFLATED := :new.DEFLATED;
  DOCUMENT_new.DEFLATE_DATE := :new.DEFLATE_DATE;
  DOCUMENT_new.DELETED := :new.DELETED;
  
  DOCUMENT_old.ID := :old.ID;
  DOCUMENT_old.GUID := :old.GUID;
  DOCUMENT_old.TITLE := :old.TITLE;
  DOCUMENT_old.TYPE := :old.TYPE;
  DOCUMENT_old.CREATOR_CODE := :old.CREATOR_CODE;
  DOCUMENT_old.CREATOR_NAME := :old.CREATOR_NAME;
  DOCUMENT_old.CREATOR_USER_CODE := :old.CREATOR_USER_CODE;
  DOCUMENT_old.CREATOR_USER_NAME := :old.CREATOR_USER_NAME;
  DOCUMENT_old.CREATION_DATE := :old.CREATION_DATE;
  DOCUMENT_old.REMOTE_APPLICATION := :old.REMOTE_APPLICATION;
  DOCUMENT_old.LAST_MODIFIED_DATE := :old.LAST_MODIFIED_DATE;
  DOCUMENT_old.DOCUMENT_DVK_STATUS_ID := :old.DOCUMENT_DVK_STATUS_ID;
  DOCUMENT_old.DVK_ID := :old.DVK_ID;
  DOCUMENT_old.DOCUMENT_WF_STATUS_ID := :old.DOCUMENT_WF_STATUS_ID;
  DOCUMENT_old.PARENT_ID := :old.PARENT_ID;
  DOCUMENT_old.LOCKED := :old.LOCKED;
  DOCUMENT_old.LOCKING_DATE := :old.LOCKING_DATE;
  DOCUMENT_old.SIGNABLE := :old.SIGNABLE;
  DOCUMENT_old.DEFLATED := :old.DEFLATED;
  DOCUMENT_old.DEFLATE_DATE := :old.DEFLATE_DATE;
  DOCUMENT_old.DELETED := :old.DELETED;

  &&ADIT_SCHEMA..ADITLOG.LOG_DOCUMENT(
    DOCUMENT_new,
    DOCUMENT_old,
    operation
  );

END;
/

CREATE OR REPLACE TRIGGER &&ADIT_SCHEMA..TR_DOC_DVK_STATUS_LOG
  after insert or update or delete
  on &&ADIT_SCHEMA..DOCUMENT_DVK_STATUS referencing old as old new as new
  for each row
DECLARE
  operation varchar2(100);
  DOCUMENT_DVK_STATUS_new &&ADIT_SCHEMA..DOCUMENT_DVK_STATUS%ROWTYPE;
  DOCUMENT_DVK_STATUS_old &&ADIT_SCHEMA..DOCUMENT_DVK_STATUS%ROWTYPE;
BEGIN

  if inserting then
    operation := 'INSERT';
  else
    if updating then
      operation := 'UPDATE';
    else
      operation := 'DELETE';
    end if;
  end if;

  DOCUMENT_DVK_STATUS_new.ID := :new.ID;
  DOCUMENT_DVK_STATUS_new.DESCRIPTION := :new.DESCRIPTION;
  
  DOCUMENT_DVK_STATUS_old.ID := :old.ID;
  DOCUMENT_DVK_STATUS_old.DESCRIPTION := :old.DESCRIPTION;

  &&ADIT_SCHEMA..ADITLOG.LOG_DOCUMENT_DVK_STATUS(
    DOCUMENT_DVK_STATUS_new,
    DOCUMENT_DVK_STATUS_old,
    operation
  );

END;
/

CREATE OR REPLACE TRIGGER &&ADIT_SCHEMA..TR_DOCUMENT_FILE_LOG
  after insert or update or delete
  on &&ADIT_SCHEMA..DOCUMENT_FILE referencing old as old new as new
  for each row
DECLARE
  operation varchar2(100);
  DOCUMENT_FILE_new &&ADIT_SCHEMA..DOCUMENT_FILE%ROWTYPE;
  DOCUMENT_FILE_old &&ADIT_SCHEMA..DOCUMENT_FILE%ROWTYPE;
BEGIN

  if inserting then
    operation := 'INSERT';
  else
    if updating then
      operation := 'UPDATE';
    else
      operation := 'DELETE';
    end if;
  end if;
  
  DOCUMENT_FILE_new.ID := :new.ID;
  DOCUMENT_FILE_new.DOCUMENT_ID := :new.DOCUMENT_ID;
  DOCUMENT_FILE_new.FILE_NAME := :new.FILE_NAME;
  DOCUMENT_FILE_new.CONTENT_TYPE := :new.CONTENT_TYPE;
  DOCUMENT_FILE_new.DESCRIPTION := :new.DESCRIPTION;
  DOCUMENT_FILE_new.FILE_SIZE_BYTES := :new.FILE_SIZE_BYTES;
  DOCUMENT_FILE_new.DELETED := :new.DELETED;
  
  DOCUMENT_FILE_old.ID := :old.ID;
  DOCUMENT_FILE_old.DOCUMENT_ID := :old.DOCUMENT_ID;
  DOCUMENT_FILE_old.FILE_NAME := :old.FILE_NAME;
  DOCUMENT_FILE_old.CONTENT_TYPE := :old.CONTENT_TYPE;
  DOCUMENT_FILE_old.DESCRIPTION := :old.DESCRIPTION;
  DOCUMENT_FILE_old.FILE_SIZE_BYTES := :old.FILE_SIZE_BYTES;
  DOCUMENT_FILE_old.DELETED := :old.DELETED;

  &&ADIT_SCHEMA..ADITLOG.LOG_DOCUMENT_FILE(
    DOCUMENT_FILE_new,
    DOCUMENT_FILE_old,
    operation
  );

END;
/

CREATE OR REPLACE TRIGGER &&ADIT_SCHEMA..TR_DOCUMENT_HISTORY_LOG
  after insert or update or delete
  on &&ADIT_SCHEMA..DOCUMENT_HISTORY referencing old as old new as new
  for each row
DECLARE
  operation varchar2(100);
  DOCUMENT_HISTORY_new &&ADIT_SCHEMA..DOCUMENT_HISTORY%ROWTYPE;
  DOCUMENT_HISTORY_old &&ADIT_SCHEMA..DOCUMENT_HISTORY%ROWTYPE;
BEGIN

  if inserting then
    operation := 'INSERT';
  else
    if updating then
      operation := 'UPDATE';
    else
      operation := 'DELETE';
    end if;
  end if;
  
  DOCUMENT_HISTORY_new.ID := :new.ID;
  DOCUMENT_HISTORY_new.DOCUMENT_ID := :new.DOCUMENT_ID;
  DOCUMENT_HISTORY_new.DOCUMENT_HISTORY_TYPE := :new.DOCUMENT_HISTORY_TYPE;
  DOCUMENT_HISTORY_new.DESCRIPTION := :new.DESCRIPTION;
  DOCUMENT_HISTORY_new.EVENT_DATE := :new.EVENT_DATE;
  DOCUMENT_HISTORY_new.USER_CODE := :new.USER_CODE;
  DOCUMENT_HISTORY_new.USER_NAME := :new.USER_NAME;
  DOCUMENT_HISTORY_new.REMOTE_APPLICATION := :new.REMOTE_APPLICATION;
  DOCUMENT_HISTORY_new.NOTIFICATION_STATUS := :new.NOTIFICATION_STATUS;
  DOCUMENT_HISTORY_new.XTEE_NOTIFICATION_ID := :new.XTEE_NOTIFICATION_ID;
  DOCUMENT_HISTORY_new.XTEE_USER_CODE := :new.XTEE_USER_CODE;
  DOCUMENT_HISTORY_new.XTEE_USER_NAME := :new.XTEE_USER_NAME;
  
  DOCUMENT_HISTORY_old.ID := :old.ID;
  DOCUMENT_HISTORY_old.DOCUMENT_ID := :old.DOCUMENT_ID;
  DOCUMENT_HISTORY_old.DOCUMENT_HISTORY_TYPE := :old.DOCUMENT_HISTORY_TYPE;
  DOCUMENT_HISTORY_old.DESCRIPTION := :old.DESCRIPTION;
  DOCUMENT_HISTORY_old.EVENT_DATE := :old.EVENT_DATE;
  DOCUMENT_HISTORY_old.USER_CODE := :old.USER_CODE;
  DOCUMENT_HISTORY_old.USER_NAME := :old.USER_NAME;
  DOCUMENT_HISTORY_old.REMOTE_APPLICATION := :old.REMOTE_APPLICATION;
  DOCUMENT_HISTORY_old.NOTIFICATION_STATUS := :old.NOTIFICATION_STATUS;
  DOCUMENT_HISTORY_old.XTEE_NOTIFICATION_ID := :old.XTEE_NOTIFICATION_ID;
  DOCUMENT_HISTORY_old.XTEE_USER_CODE := :old.XTEE_USER_CODE;
  DOCUMENT_HISTORY_old.XTEE_USER_NAME := :old.XTEE_USER_NAME;

  &&ADIT_SCHEMA..ADITLOG.LOG_DOCUMENT_HISTORY(
    DOCUMENT_HISTORY_new,
    DOCUMENT_HISTORY_old,
    operation
  );

END;
/

CREATE OR REPLACE TRIGGER &&ADIT_SCHEMA..TR_DOCUMENT_HISTORY_TYPE_LOG
  after insert or update or delete
  on &&ADIT_SCHEMA..DOCUMENT_HISTORY_TYPE referencing old as old new as new
  for each row
DECLARE
  operation varchar2(100);
  DOCUMENT_HISTORY_TYPE_new &&ADIT_SCHEMA..DOCUMENT_HISTORY_TYPE%ROWTYPE;
  DOCUMENT_HISTORY_TYPE_old &&ADIT_SCHEMA..DOCUMENT_HISTORY_TYPE%ROWTYPE;
BEGIN

  if inserting then
    operation := 'INSERT';
  else
    if updating then
      operation := 'UPDATE';
    else
      operation := 'DELETE';
    end if;
  end if;
  
  DOCUMENT_HISTORY_TYPE_new.SHORT_NAME := :new.SHORT_NAME;
  DOCUMENT_HISTORY_TYPE_new.DESCRIPTION := :new.SHORT_NAME;
  
  DOCUMENT_HISTORY_TYPE_old.SHORT_NAME := :old.SHORT_NAME;
  DOCUMENT_HISTORY_TYPE_old.DESCRIPTION := :old.SHORT_NAME;

  &&ADIT_SCHEMA..ADITLOG.LOG_DOCUMENT_HISTORY_TYPE(
    DOCUMENT_HISTORY_TYPE_new,
    DOCUMENT_HISTORY_TYPE_old,
    operation
  );

END;
/

CREATE OR REPLACE TRIGGER &&ADIT_SCHEMA..TR_DOCUMENT_SHARING_LOG
  after insert or update or delete
  on &&ADIT_SCHEMA..DOCUMENT_SHARING referencing old as old new as new
  for each row
DECLARE
  operation varchar2(100);
  DOCUMENT_SHARING_new &&ADIT_SCHEMA..DOCUMENT_SHARING%ROWTYPE;
  DOCUMENT_SHARING_old &&ADIT_SCHEMA..DOCUMENT_SHARING%ROWTYPE;
BEGIN

  if inserting then
    operation := 'INSERT';
  else
    if updating then
      operation := 'UPDATE';
    else
      operation := 'DELETE';
    end if;
  end if;

  DOCUMENT_SHARING_new.ID := :new.ID;
  DOCUMENT_SHARING_new.DOCUMENT_ID := :new.DOCUMENT_ID;
  DOCUMENT_SHARING_new.USER_CODE := :new.USER_CODE;
  DOCUMENT_SHARING_new.USER_NAME := :new.USER_NAME;
  DOCUMENT_SHARING_new.SHARING_TYPE := :new.SHARING_TYPE;
  DOCUMENT_SHARING_new.TASK_DESCRIPTION := :new.TASK_DESCRIPTION;
  DOCUMENT_SHARING_new.CREATION_DATE := :new.CREATION_DATE;
  DOCUMENT_SHARING_new.DVK_STATUS_ID := :new.DVK_STATUS_ID;
  DOCUMENT_SHARING_new.WF_STATUS_ID := :new.WF_STATUS_ID;
  DOCUMENT_SHARING_new.FIRST_ACCESS_DATE := :new.FIRST_ACCESS_DATE;
  DOCUMENT_SHARING_new.DVK_ID := :new.DVK_ID;
  
  DOCUMENT_SHARING_old.ID := :old.ID;
  DOCUMENT_SHARING_old.DOCUMENT_ID := :old.DOCUMENT_ID;
  DOCUMENT_SHARING_old.USER_CODE := :old.USER_CODE;
  DOCUMENT_SHARING_old.USER_NAME := :old.USER_NAME;
  DOCUMENT_SHARING_old.SHARING_TYPE := :old.SHARING_TYPE;
  DOCUMENT_SHARING_old.TASK_DESCRIPTION := :old.TASK_DESCRIPTION;
  DOCUMENT_SHARING_old.CREATION_DATE := :old.CREATION_DATE;
  DOCUMENT_SHARING_old.DVK_STATUS_ID := :old.DVK_STATUS_ID;
  DOCUMENT_SHARING_old.WF_STATUS_ID := :old.WF_STATUS_ID;
  DOCUMENT_SHARING_old.FIRST_ACCESS_DATE := :old.FIRST_ACCESS_DATE;
  DOCUMENT_SHARING_old.DVK_ID := :old.DVK_ID;

  &&ADIT_SCHEMA..ADITLOG.LOG_DOCUMENT_SHARING(
    DOCUMENT_SHARING_new,
    DOCUMENT_SHARING_old,
    operation
  );

END;
/

CREATE OR REPLACE TRIGGER &&ADIT_SCHEMA..TR_DOCUMENT_SHARING_TYPE_LOG
  after insert or update or delete
  on &&ADIT_SCHEMA..DOCUMENT_SHARING_TYPE referencing old as old new as new
  for each row
DECLARE
  operation varchar2(100);
  DOCUMENT_SHARING_TYPE_new &&ADIT_SCHEMA..DOCUMENT_SHARING_TYPE%ROWTYPE;
  DOCUMENT_SHARING_TYPE_old &&ADIT_SCHEMA..DOCUMENT_SHARING_TYPE%ROWTYPE;
BEGIN

  if inserting then
    operation := 'INSERT';
  else
    if updating then
      operation := 'UPDATE';
    else
      operation := 'DELETE';
    end if;
  end if;

  DOCUMENT_SHARING_TYPE_new.SHORT_NAME := :new.SHORT_NAME;
  DOCUMENT_SHARING_TYPE_new.DESCRIPTION := :new.DESCRIPTION;
  
  DOCUMENT_SHARING_TYPE_old.SHORT_NAME := :old.SHORT_NAME;
  DOCUMENT_SHARING_TYPE_old.DESCRIPTION := :old.DESCRIPTION;

  &&ADIT_SCHEMA..ADITLOG.LOG_DOCUMENT_SHARING_TYPE(
    DOCUMENT_SHARING_TYPE_new,
    DOCUMENT_SHARING_TYPE_old,
    operation
  );

END;
/

CREATE OR REPLACE TRIGGER &&ADIT_SCHEMA..TR_DOCUMENT_TYPE_LOG
  after insert or update or delete
  on &&ADIT_SCHEMA..DOCUMENT_TYPE referencing old as old new as new
  for each row
DECLARE
  operation varchar2(100);
  DOCUMENT_TYPE_new &&ADIT_SCHEMA..DOCUMENT_TYPE%ROWTYPE;
  DOCUMENT_TYPE_old &&ADIT_SCHEMA..DOCUMENT_TYPE%ROWTYPE;
BEGIN

  if inserting then
    operation := 'INSERT';
  else
    if updating then
      operation := 'UPDATE';
    else
      operation := 'DELETE';
    end if;
  end if;

  DOCUMENT_TYPE_new.SHORT_NAME := :new.SHORT_NAME;
  DOCUMENT_TYPE_new.DESCRIPTION := :new.DESCRIPTION;
  
  DOCUMENT_TYPE_old.SHORT_NAME := :old.SHORT_NAME;
  DOCUMENT_TYPE_old.DESCRIPTION := :old.DESCRIPTION;

  &&ADIT_SCHEMA..ADITLOG.LOG_DOCUMENT_TYPE(
    DOCUMENT_TYPE_new,
    DOCUMENT_TYPE_old,
    operation
  );

END;
/

CREATE OR REPLACE TRIGGER &&ADIT_SCHEMA..TR_DOCUMENT_WF_STATUS_LOG
  after insert or update or delete
  on &&ADIT_SCHEMA..DOCUMENT_WF_STATUS referencing old as old new as new
  for each row
DECLARE
  operation varchar2(100);
  DOCUMENT_WF_STATUS_new &&ADIT_SCHEMA..DOCUMENT_WF_STATUS%ROWTYPE;
  DOCUMENT_WF_STATUS_old &&ADIT_SCHEMA..DOCUMENT_WF_STATUS%ROWTYPE;
BEGIN

  if inserting then
    operation := 'INSERT';
  else
    if updating then
      operation := 'UPDATE';
    else
      operation := 'DELETE';
    end if;
  end if;
  
  DOCUMENT_WF_STATUS_new.ID := :new.ID;
  DOCUMENT_WF_STATUS_new.DESCRIPTION := :new.DESCRIPTION;
  DOCUMENT_WF_STATUS_new.NAME := :new.NAME;
  
  DOCUMENT_WF_STATUS_old.ID := :old.ID;
  DOCUMENT_WF_STATUS_old.DESCRIPTION := :old.DESCRIPTION;
  DOCUMENT_WF_STATUS_old.NAME := :old.NAME;

  &&ADIT_SCHEMA..ADITLOG.LOG_DOCUMENT_WF_STATUS(
    DOCUMENT_WF_STATUS_new,
    DOCUMENT_WF_STATUS_old,
    operation
  );

END;
/

CREATE OR REPLACE TRIGGER &&ADIT_SCHEMA..TR_NOTIFICATION_LOG
  after insert or update or delete
  on &&ADIT_SCHEMA..NOTIFICATION referencing old as old new as new
  for each row
DECLARE
  operation varchar2(100);
  NOTIFICATION_new &&ADIT_SCHEMA..NOTIFICATION%ROWTYPE;
  NOTIFICATION_old &&ADIT_SCHEMA..NOTIFICATION%ROWTYPE;
BEGIN

  if inserting then
    operation := 'INSERT';
  else
    if updating then
      operation := 'UPDATE';
    else
      operation := 'DELETE';
    end if;
  end if;
  
  NOTIFICATION_new.ID := :new.ID;
  NOTIFICATION_new.USER_CODE := :new.USER_CODE;
  NOTIFICATION_new.DOCUMENT_ID := :new.DOCUMENT_ID;
  NOTIFICATION_new.EVENT_DATE := :new.EVENT_DATE;
  NOTIFICATION_new.NOTIFICATION_TYPE := :new.NOTIFICATION_TYPE;
  NOTIFICATION_new.NOTIFICATION_TEXT := :new.NOTIFICATION_TEXT;
  NOTIFICATION_new.NOTIFICATION_ID := :new.NOTIFICATION_ID;
  NOTIFICATION_new.NOTIFICATION_SENDING_DATE := :new.NOTIFICATION_SENDING_DATE;
  
  NOTIFICATION_old.ID := :old.ID;
  NOTIFICATION_old.USER_CODE := :old.USER_CODE;
  NOTIFICATION_old.DOCUMENT_ID := :old.DOCUMENT_ID;
  NOTIFICATION_old.EVENT_DATE := :old.EVENT_DATE;
  NOTIFICATION_old.NOTIFICATION_TYPE := :old.NOTIFICATION_TYPE;
  NOTIFICATION_old.NOTIFICATION_TEXT := :old.NOTIFICATION_TEXT;
  NOTIFICATION_old.NOTIFICATION_ID := :old.NOTIFICATION_ID;
  NOTIFICATION_old.NOTIFICATION_SENDING_DATE := :old.NOTIFICATION_SENDING_DATE;

  &&ADIT_SCHEMA..ADITLOG.LOG_NOTIFICATION(
    NOTIFICATION_new,
    NOTIFICATION_old,
    operation
  );

END;
/

CREATE OR REPLACE TRIGGER &&ADIT_SCHEMA..TR_NOTIFICATION_TYPE_LOG
  after insert or update or delete
  on &&ADIT_SCHEMA..NOTIFICATION_TYPE referencing old as old new as new
  for each row
DECLARE
  operation varchar2(100);
  NOTIFICATION_TYPE_new &&ADIT_SCHEMA..NOTIFICATION_TYPE%ROWTYPE;
  NOTIFICATION_TYPE_old &&ADIT_SCHEMA..NOTIFICATION_TYPE%ROWTYPE;
BEGIN

  if inserting then
    operation := 'INSERT';
  else
    if updating then
      operation := 'UPDATE';
    else
      operation := 'DELETE';
    end if;
  end if;

  NOTIFICATION_TYPE_new.SHORT_NAME := :new.SHORT_NAME;
  NOTIFICATION_TYPE_new.DESCRIPTION := :new.DESCRIPTION;
  
  NOTIFICATION_TYPE_old.SHORT_NAME := :old.SHORT_NAME;
  NOTIFICATION_TYPE_old.DESCRIPTION := :old.DESCRIPTION;

  &&ADIT_SCHEMA..ADITLOG.LOG_NOTIFICATION_TYPE(
    NOTIFICATION_TYPE_new,
    NOTIFICATION_TYPE_old,
    operation
  );

END;
/

CREATE OR REPLACE TRIGGER &&ADIT_SCHEMA..TR_REMOTE_APPLICATION_LOG
  after insert or update or delete
  on &&ADIT_SCHEMA..REMOTE_APPLICATION referencing old as old new as new
  for each row
DECLARE
  operation varchar2(100);
  REMOTE_APPLICATION_new &&ADIT_SCHEMA..REMOTE_APPLICATION%ROWTYPE;
  REMOTE_APPLICATION_old &&ADIT_SCHEMA..REMOTE_APPLICATION%ROWTYPE;
BEGIN

  if inserting then
    operation := 'INSERT';
  else
    if updating then
      operation := 'UPDATE';
    else
      operation := 'DELETE';
    end if;
  end if;

  REMOTE_APPLICATION_new.SHORT_NAME := :new.SHORT_NAME;
  REMOTE_APPLICATION_new.NAME := :new.NAME;
  REMOTE_APPLICATION_new.ORGANIZATION_CODE := :new.ORGANIZATION_CODE;
  REMOTE_APPLICATION_new.CAN_READ := :new.CAN_READ;
  REMOTE_APPLICATION_new.CAN_WRITE := :new.CAN_WRITE;
  
  REMOTE_APPLICATION_old.SHORT_NAME := :old.SHORT_NAME;
  REMOTE_APPLICATION_old.NAME := :old.NAME;
  REMOTE_APPLICATION_old.ORGANIZATION_CODE := :old.ORGANIZATION_CODE;
  REMOTE_APPLICATION_old.CAN_READ := :old.CAN_READ;
  REMOTE_APPLICATION_old.CAN_WRITE := :old.CAN_WRITE;

  &&ADIT_SCHEMA..ADITLOG.LOG_REMOTE_APPLICATION(
    REMOTE_APPLICATION_new,
    REMOTE_APPLICATION_old,
    operation
  );

END;
/

CREATE OR REPLACE TRIGGER &&ADIT_SCHEMA..TR_SIGNATURE_LOG
  after insert or update or delete
  on &&ADIT_SCHEMA..SIGNATURE referencing old as old new as new
  for each row
DECLARE
  operation varchar2(100);
  SIGNATURE_new &&ADIT_SCHEMA..SIGNATURE%ROWTYPE;
  SIGNATURE_old &&ADIT_SCHEMA..SIGNATURE%ROWTYPE;
BEGIN

  if inserting then
    operation := 'INSERT';
  else
    if updating then
      operation := 'UPDATE';
    else
      operation := 'DELETE';
    end if;
  end if;

  SIGNATURE_new.ID := :new.ID;
  SIGNATURE_new.USER_CODE := :new.USER_CODE;
  SIGNATURE_new.DOCUMENT_ID := :new.DOCUMENT_ID;
  SIGNATURE_new.SIGNER_ROLE := :new.SIGNER_ROLE;
  SIGNATURE_new.RESOLUTION := :new.RESOLUTION;
  SIGNATURE_new.COUNTRY := :new.COUNTRY;
  SIGNATURE_new.COUNTY := :new.COUNTY;
  SIGNATURE_new.CITY := :new.CITY;
  SIGNATURE_new.POST_INDEX := :new.POST_INDEX;
  SIGNATURE_new.SIGNER_CODE := :new.SIGNER_CODE;
  SIGNATURE_new.SIGNER_NAME := :new.SIGNER_NAME;
  
  SIGNATURE_old.ID := :old.ID;
  SIGNATURE_old.USER_CODE := :old.USER_CODE;
  SIGNATURE_old.DOCUMENT_ID := :old.DOCUMENT_ID;
  SIGNATURE_old.SIGNER_ROLE := :old.SIGNER_ROLE;
  SIGNATURE_old.RESOLUTION := :old.RESOLUTION;
  SIGNATURE_old.COUNTRY := :old.COUNTRY;
  SIGNATURE_old.COUNTY := :old.COUNTY;
  SIGNATURE_old.CITY := :old.CITY;
  SIGNATURE_old.POST_INDEX := :old.POST_INDEX;
  SIGNATURE_old.SIGNER_CODE := :old.SIGNER_CODE;
  SIGNATURE_old.SIGNER_NAME := :old.SIGNER_NAME;

  &&ADIT_SCHEMA..ADITLOG.LOG_SIGNATURE(
    SIGNATURE_new,
    SIGNATURE_old,
    operation
  );

END;
/

CREATE OR REPLACE TRIGGER &&ADIT_SCHEMA..TR_USER_NOTIFICATION_LOG
  after insert or update or delete
  on &&ADIT_SCHEMA..USER_NOTIFICATION referencing old as old new as new
  for each row
DECLARE
  operation varchar2(100);
  USER_NOTIFICATION_new &&ADIT_SCHEMA..USER_NOTIFICATION%ROWTYPE;
  USER_NOTIFICATION_old &&ADIT_SCHEMA..USER_NOTIFICATION%ROWTYPE;
BEGIN

  if inserting then
    operation := 'INSERT';
  else
    if updating then
      operation := 'UPDATE';
    else
      operation := 'DELETE';
    end if;
  end if;

  USER_NOTIFICATION_new.USER_CODE := :new.USER_CODE;
  USER_NOTIFICATION_new.NOTIFICATION_TYPE := :new.NOTIFICATION_TYPE;
  
  USER_NOTIFICATION_old.USER_CODE := :old.USER_CODE;
  USER_NOTIFICATION_old.NOTIFICATION_TYPE := :old.NOTIFICATION_TYPE;

  &&ADIT_SCHEMA..ADITLOG.LOG_USER_NOTIFICATION(
    USER_NOTIFICATION_new,
    USER_NOTIFICATION_old,
    operation
  );

END;
/

CREATE OR REPLACE TRIGGER &&ADIT_SCHEMA..TR_USERTYPE_LOG
  after insert or update or delete
  on &&ADIT_SCHEMA..USERTYPE referencing old as old new as new
  for each row
DECLARE
  operation varchar2(100);
  USERTYPE_new &&ADIT_SCHEMA..USERTYPE%ROWTYPE;
  USERTYPE_old &&ADIT_SCHEMA..USERTYPE%ROWTYPE;
BEGIN

  if inserting then
    operation := 'INSERT';
  else
    if updating then
      operation := 'UPDATE';
    else
      operation := 'DELETE';
    end if;
  end if;

  USERTYPE_new.SHORT_NAME := :new.SHORT_NAME;
  USERTYPE_new.DESCRIPTION := :new.DESCRIPTION;
  USERTYPE_new.DISK_QUOTA := :new.DISK_QUOTA;

  USERTYPE_old.SHORT_NAME := :old.SHORT_NAME;
  USERTYPE_old.DESCRIPTION := :old.DESCRIPTION;
  USERTYPE_old.DISK_QUOTA := :old.DISK_QUOTA;

  &&ADIT_SCHEMA..ADITLOG.LOG_USERTYPE(
    USERTYPE_new,
    USERTYPE_old,
    operation
  );

END;
/

CREATE OR REPLACE TRIGGER &&ADIT_SCHEMA..TR_USER_CONTACT_LOG
  after insert or update or delete
  on &&ADIT_SCHEMA..USER_CONTACT referencing old as old new as new
  for each row
DECLARE
  operation varchar2(100);
  USER_CONTACT_new &&ADIT_SCHEMA..USER_CONTACT%ROWTYPE;
  USER_CONTACT_old &&ADIT_SCHEMA..USER_CONTACT%ROWTYPE;
BEGIN

  if inserting then
    operation := 'INSERT';
  else
    if updating then
      operation := 'UPDATE';
    else
      operation := 'DELETE';
    end if;
  end if;

  USER_CONTACT_new.USER_CODE := :new.USER_CODE;
  USER_CONTACT_new.CONTACT_CODE := :new.CONTACT_CODE;
  USER_CONTACT_new.LAST_USED_DATE := :new.LAST_USED_DATE;

  USER_CONTACT_old.USER_CODE := :old.USER_CODE;
  USER_CONTACT_old.CONTACT_CODE := :old.CONTACT_CODE;
  USER_CONTACT_old.LAST_USED_DATE := :old.LAST_USED_DATE;

  &&ADIT_SCHEMA..ADITLOG.LOG_USER_CONTACT(
    USER_CONTACT_new,
    USER_CONTACT_old,
    operation
  );

END;
/