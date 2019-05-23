prompt Creating HIBERNATE_SEQUENCES...
create table HIBERNATE_SEQUENCES
(
  sequence_name          VARCHAR2(255),
  sequence_next_hi_value NUMBER(10)
)
;

prompt Creating TB_L_BATCH_STATUS_LOG...
create table TB_L_BATCH_STATUS_LOG
(
  seq_no       NUMBER not null,
  batch_id     VARCHAR2(10) not null,
  request_id   CHAR(8),
  message      VARCHAR2(200) not null,
  request_by   VARCHAR2(10),
  run_date     DATE not null,
  support_id   VARCHAR2(10),
  parameters   VARCHAR2(450),
  project_code CHAR(3),
  description  VARCHAR2(200),
  app_id       VARCHAR2(10)
)
;

prompt Creating TB_L_EXCEL_DOWNLOAD_FILE...
create table TB_L_EXCEL_DOWNLOAD_FILE
(
  doc_id        VARCHAR2(10) not null,
  file_no       NUMBER(4) not null,
  file_size     NUMBER(8),
  file_name     VARCHAR2(100),
  exec_start_dt DATE,
  exec_end_dt   DATE,
  status        CHAR(1),
  update_by     VARCHAR2(20) not null,
  update_dt     TIMESTAMP(6) not null
)
;
alter table TB_L_EXCEL_DOWNLOAD_FILE
  add constraint PK_L_EXCEL_DOWNLOAD_FILE primary key (DOC_ID, FILE_NO);

  -- Create table
create table TB_L_EXCEL_DOWNLOAD_STATUS
(
  doc_id           VARCHAR2(10) not null,
  module_id        VARCHAR2(8) not null,
  function_id      VARCHAR2(8) not null,
  report_name      VARCHAR2(100),
  file_cnt         NUMBER(4),
  start_row        NUMBER(5) not null,
  start_column     NUMBER(3) not null,
  max_exe_time     NUMBER(3) not null,
  max_xls_size     NUMBER(3) not null,
  pic_email        VARCHAR2(100),
  criteria_legend  VARCHAR2(3000),
  sql_stmt         CLOB,
  status           CHAR(1) not null,
  ext_xls_gen      VARCHAR2(100),
  ext_xls_params   VARCHAR2(650),
  override_path    CHAR(200),
  model_class_name VARCHAR2(500),
  display_names    VARCHAR2(3000),
  request_by       VARCHAR2(20) not null,
  request_dt       TIMESTAMP(6) not null,
  update_by        VARCHAR2(20) not null,
  update_dt        TIMESTAMP(6) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_L_EXCEL_DOWNLOAD_STATUS
  add constraint PK_L_EXCEL_DOWNLOAD_STATUS primary key (DOC_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
  
prompt Creating TB_L_LOGGER...
create table TB_L_LOGGER
(
  d_hodtcre      DATE not null,
  n_seq_no       NUMBER(9) not null,
  v_apl_id       VARCHAR2(10),
  v_module_id    VARCHAR2(10) not null,
  v_function_id  VARCHAR2(10) not null,
  v_usercre      VARCHAR2(20) not null,
  v_message_type VARCHAR2(1) not null,
  v_message_code VARCHAR2(12),
  v_message      VARCHAR2(2000) not null,
  v_status       VARCHAR2(1)
)
;
alter table TB_L_LOGGER
  add constraint PK_L_LOGGER primary key (N_SEQ_NO);

prompt Creating TB_M_AMPHUR...
create table TB_M_AMPHUR
(
  amphur_code     VARCHAR2(4) not null,
  amphur_name     VARCHAR2(150) not null,
  amphur_name_eng VARCHAR2(150) not null,
  geo_id          NUMBER(5) default '0',
  province_code   VARCHAR2(2) not null,
  create_by       VARCHAR2(20) not null,
  create_dt       TIMESTAMP(6) not null,
  update_by       VARCHAR2(20) not null,
  update_dt       TIMESTAMP(6) not null
)
;

prompt Creating TB_M_BATCH...
create table TB_M_BATCH
(
  batch_id         VARCHAR2(10) not null,
  project_code     CHAR(3) not null,
  batch_name       VARCHAR2(100),
  priority_level   NUMBER default 0,
  concurrency_flag NUMBER default 1,
  running_count    NUMBER not null,
  run_as           VARCHAR2(10) not null,
  shell            VARCHAR2(255) not null,
  create_by        VARCHAR2(8),
  create_dt        TIMESTAMP(6) default systimestamp not null,
  update_by        VARCHAR2(8),
  update_dt        TIMESTAMP(6) default systimestamp not null,
  support_id       VARCHAR2(10)
)
;

prompt Creating TB_M_CALENDAR...
create table TB_M_CALENDAR
(
  getsudo_month VARCHAR2(6) not null,
  timing        VARCHAR2(4) not null,
  plant         VARCHAR2(20) not null,
  calendar_date DATE not null,
  calendar_flag VARCHAR2(1),
  plant_type    VARCHAR2(1),
  create_by     VARCHAR2(20) not null,
  create_dt     TIMESTAMP(6) not null,
  update_by     VARCHAR2(20) not null,
  update_dt     TIMESTAMP(6) not null
)
;

prompt Creating TB_M_CUSTOMER_COMPANY...
create table TB_M_CUSTOMER_COMPANY
(
  tax_id        VARCHAR2(20) not null,
  phone         VARCHAR2(100) not null,
  company_name  VARCHAR2(100) not null,
  branch_no     VARCHAR2(100) not null,
  register_date DATE not null,
  first_name    VARCHAR2(100) not null,
  last_name     VARCHAR2(100),
  address1      VARCHAR2(100),
  address2      VARCHAR2(100),
  province      VARCHAR2(100),
  district      VARCHAR2(100),
  sub_district  VARCHAR2(100),
  zipcode       VARCHAR2(100),
  mobile        VARCHAR2(100),
  email         VARCHAR2(100),
  create_by     VARCHAR2(20) not null,
  create_dt     TIMESTAMP(6) not null,
  update_by     VARCHAR2(20) not null,
  update_dt     TIMESTAMP(6) not null
)
;

prompt Creating TB_M_CUSTOMER_PERSONAL...
create table TB_M_CUSTOMER_PERSONAL
(
  id_card      VARCHAR2(20) not null,
  mobile       VARCHAR2(100) not null,
  title1       VARCHAR2(100) not null,
  title2       VARCHAR2(100) not null,
  first_name   VARCHAR2(100) not null,
  last_name    VARCHAR2(100) not null,
  gender       VARCHAR2(100),
  birth_date   DATE,
  address1     VARCHAR2(100),
  address2     VARCHAR2(100),
  province     VARCHAR2(100),
  district     VARCHAR2(100),
  sub_district VARCHAR2(100),
  zipcode      VARCHAR2(100),
  telephone    VARCHAR2(100),
  email        VARCHAR2(100),
  line_no      VARCHAR2(100),
  create_by    VARCHAR2(20) not null,
  create_dt    TIMESTAMP(6) not null,
  update_by    VARCHAR2(20) not null,
  update_dt    TIMESTAMP(6) not null
)
;

prompt Creating TB_M_DISTRICT...
create table TB_M_DISTRICT
(
  district_code     VARCHAR2(6) not null,
  district_name     VARCHAR2(150) not null,
  district_name_eng VARCHAR2(150) not null,
  amphur_code       VARCHAR2(4) not null,
  province_code     VARCHAR2(2) not null,
  geo_id            NUMBER(5) default '0',
  create_by         VARCHAR2(20) not null,
  create_dt         TIMESTAMP(6) not null,
  update_by         VARCHAR2(20) not null,
  update_dt         TIMESTAMP(6) not null
)
;

prompt Creating TB_M_HIST_SEQ...
create table TB_M_HIST_SEQ
(
  seq_code      VARCHAR2(10) not null,
  seq_key       VARCHAR2(10) not null,
  current_value NUMBER(10) not null,
  start_value   NUMBER(10) not null,
  doc_no_format VARCHAR2(50) not null,
  start_month   NUMBER(2) not null,
  create_by     VARCHAR2(20) not null,
  create_dt     DATE not null,
  update_by     VARCHAR2(20) not null,
  update_dt     DATE not null,
  history_key   VARCHAR2(10) not null
)
;
alter table TB_M_HIST_SEQ
  add constraint PK_M_HIST_SEQ primary key (SEQ_CODE, HISTORY_KEY);

prompt Creating TB_M_MODULE_D...
create table TB_M_MODULE_D
(
  v_module_id     VARCHAR2(10) not null,
  v_function_id   VARCHAR2(10) not null,
  v_function_name VARCHAR2(100),
  v_error_flag    CHAR(1),
  create_by       VARCHAR2(20) not null,
  create_dt       TIMESTAMP(6) not null,
  update_by       VARCHAR2(20) not null,
  update_dt       TIMESTAMP(6) not null
)
;
alter table TB_M_MODULE_D
  add constraint PK_M_MODULE_D primary key (V_MODULE_ID, V_FUNCTION_ID);

prompt Creating TB_M_MODULE_H...
create table TB_M_MODULE_H
(
  v_module_id   VARCHAR2(10) not null,
  v_module_name VARCHAR2(100),
  create_by     VARCHAR2(20) not null,
  create_dt     TIMESTAMP(6) not null,
  update_by     VARCHAR2(20) not null,
  update_dt     TIMESTAMP(6) not null
)
;
alter table TB_M_MODULE_H
  add constraint PK_M_MODULE_H primary key (V_MODULE_ID);

prompt Creating TB_M_PROVINCE...
create table TB_M_PROVINCE
(
  province_code     VARCHAR2(2) not null,
  province_name     VARCHAR2(150) not null,
  province_name_eng VARCHAR2(150) not null,
  geo_id            NUMBER(5) default '0',
  create_by         VARCHAR2(20) not null,
  create_dt         TIMESTAMP(6) not null,
  update_by         VARCHAR2(20) not null,
  update_dt         TIMESTAMP(6) not null
)
;

prompt Creating TB_M_SEQ...
create table TB_M_SEQ
(
  seq_code      VARCHAR2(10) not null,
  seq_key       VARCHAR2(10) not null,
  current_value NUMBER(10) not null,
  start_value   NUMBER(10) not null,
  doc_no_format VARCHAR2(50) not null,
  start_month   NUMBER(2) not null,
  create_by     VARCHAR2(20) not null,
  create_dt     DATE not null,
  update_by     VARCHAR2(20) not null,
  update_dt     DATE not null
)
;
alter table TB_M_SEQ
  add constraint PK_M_SEQ primary key (SEQ_CODE);

prompt Creating TB_M_SYSTEM...
create table TB_M_SYSTEM
(
  category     VARCHAR2(40) not null,
  sub_category VARCHAR2(40) not null,
  cd           VARCHAR2(40) not null,
  value        VARCHAR2(200) not null,
  remark       VARCHAR2(200),
  status       VARCHAR2(1) not null,
  create_by    VARCHAR2(20) not null,
  create_dt    TIMESTAMP(6) not null,
  update_by    VARCHAR2(20) not null,
  update_dt    TIMESTAMP(6) not null
)
;
create index IX_M_SYSTEM1 on TB_M_SYSTEM (CATEGORY, SUB_CATEGORY, CD, VALUE, STATUS);
create index IX_M_SYSTEM2 on TB_M_SYSTEM (CATEGORY, SUB_CATEGORY, STATUS);
alter table TB_M_SYSTEM
  add constraint PK_M_SYSTEM primary key (CATEGORY, SUB_CATEGORY, CD);

prompt Creating TB_M_VEHICLE...
create table TB_M_VEHICLE
(
  veh_brand  VARCHAR2(50) not null,
  veh_vin_no VARCHAR2(20) not null,
  veh_series VARCHAR2(30) not null,
  veh_model  VARCHAR2(6) not null,
  veh_color  VARCHAR2(5) not null,
  veh_year   VARCHAR2(4) not null,
  veh_reg_no VARCHAR2(20) not null,
  veh_engine VARCHAR2(20) not null,
  veh_weight VARCHAR2(20) not null,
  veh_cc     VARCHAR2(20) not null,
  veh_type   VARCHAR2(20) not null,
  create_by  VARCHAR2(20) not null,
  create_dt  TIMESTAMP(6) not null,
  update_by  VARCHAR2(20) not null,
  update_dt  TIMESTAMP(6) not null
)
;

prompt Creating TB_M_ZIPCODES...
create table TB_M_ZIPCODES
(
  zipcode       VARCHAR2(11) not null,
  district_code VARCHAR2(6) not null,
  create_by     VARCHAR2(20) not null,
  create_dt     TIMESTAMP(6) not null,
  update_by     VARCHAR2(20) not null,
  update_dt     TIMESTAMP(6) not null
)
;

prompt Creating TB_R_BATCH_QUEUE...
create table TB_R_BATCH_QUEUE
(
  queue_no     NUMBER not null,
  request_id   VARCHAR2(8) not null,
  batch_id     VARCHAR2(10) not null,
  request_date DATE not null,
  request_by   VARCHAR2(100) not null,
  parameters   VARCHAR2(450),
  support_id   VARCHAR2(10),
  project_code CHAR(3),
  description  VARCHAR2(200),
  app_id       VARCHAR2(10)
)
;

prompt Creating TB_R_CAR_INSURANCE...
create table TB_R_CAR_INSURANCE
(
  document_no             VARCHAR2(10) not null,
  document_status         VARCHAR2(2),
  veh_brand               VARCHAR2(50) not null,
  veh_vin_no              VARCHAR2(20) not null,
  veh_series              VARCHAR2(30),
  veh_model               VARCHAR2(6),
  veh_color               VARCHAR2(5),
  veh_year                VARCHAR2(4),
  veh_reg_no              VARCHAR2(100),
  veh_engine              VARCHAR2(20),
  veh_weight              VARCHAR2(20),
  veh_cc                  VARCHAR2(20),
  veh_type                VARCHAR2(20),
  fin_type_purchase       VARCHAR2(1) not null,
  fin_leasing_company     VARCHAR2(20) not null,
  ins_choice              VARCHAR2(20),
  ins_company             VARCHAR2(20),
  ins_class               VARCHAR2(20),
  ins_type                VARCHAR2(20),
  ins_premium_type        VARCHAR2(20),
  ins_coverage_year       VARCHAR2(20),
  ins_premium             NUMBER(10),
  ins_coverage            NUMBER(10),
  ins_act                 NUMBER(5,2),
  ins_activation_date     DATE,
  ins_coverage_date       DATE,
  ins_policy_no           VARCHAR2(20),
  ins_temp_policy_no      VARCHAR2(20),
  ins_remark              VARCHAR2(2000),
  cus_type                VARCHAR2(1),
  cus_policy_delivery     VARCHAR2(1),
  cus_p_id_card           VARCHAR2(20),
  cus_p_mobile            VARCHAR2(20),
  cus_p_title1            VARCHAR2(20),
  cus_p_title2            VARCHAR2(20),
  cus_p_first_name        VARCHAR2(20),
  cus_p_last_name         VARCHAR2(20),
  cus_p_gender            VARCHAR2(1),
  cus_p_birth_date        DATE,
  cus_p_address1          VARCHAR2(200),
  cus_p_address2          VARCHAR2(200),
  cus_p_province          VARCHAR2(20),
  cus_p_district          VARCHAR2(20),
  cus_p_sub_district      VARCHAR2(20),
  cus_p_zipcode           VARCHAR2(5),
  cus_p_telephone         VARCHAR2(20),
  cus_p_same_address_flag VARCHAR2(1),
  cus_p_bill_address1     VARCHAR2(200),
  cus_p_bill_address2     VARCHAR2(200),
  cus_p_bill_province     VARCHAR2(20),
  cus_p_bill_district     VARCHAR2(20),
  cus_p_bill_sub_district VARCHAR2(20),
  cus_p_bill_zipcode      VARCHAR2(5),
  cus_p_beneficiary       VARCHAR2(20),
  cus_p_ref_tel_no        VARCHAR2(20),
  cus_p_line_id           VARCHAR2(20),
  cus_p_email             VARCHAR2(20),
  cus_c_tax_id            VARCHAR2(20),
  cus_c_phone             VARCHAR2(20),
  cus_company_name        VARCHAR2(20),
  cus_c_branch_no         VARCHAR2(20),
  cus_c_register_date     VARCHAR2(20),
  cus_c_first_name        VARCHAR2(20),
  cus_c_last_name         VARCHAR2(1),
  cus_c_address1          VARCHAR2(200),
  cus_c_address2          VARCHAR2(200),
  cus_c_province          VARCHAR2(20),
  cus_c_district          VARCHAR2(20),
  cus_c_sub_district      VARCHAR2(20),
  cus_c_zipcode           VARCHAR2(5),
  cus_c_mobile            VARCHAR2(20),
  cus_c_same_address_flag VARCHAR2(1),
  cus_c_bill_address1     VARCHAR2(200),
  cus_c_bill_address2     VARCHAR2(200),
  cus_c_bill_province     VARCHAR2(20),
  cus_c_bill_district     VARCHAR2(20),
  cus_c_bill_sub_district VARCHAR2(20),
  cus_c_bill_zipcode      VARCHAR2(5),
  cus_c_email             VARCHAR2(20),
  cancel_reason           VARCHAR2(20),
  cancel_by               VARCHAR2(20),
  cancel_date             TIMESTAMP(6),
  create_by               VARCHAR2(20) not null,
  create_dt               TIMESTAMP(6) not null,
  update_by               VARCHAR2(20) not null,
  update_dt               TIMESTAMP(6) not null
)
;

prompt Creating TB_R_ODB_ROLES...
create table TB_R_ODB_ROLES
(
  doc_id    VARCHAR2(10) not null,
  create_dt TIMESTAMP(6),
  role_id   VARCHAR2(50),
  id        VARCHAR2(60)
)
;

prompt Truncating TB_R_ODB_ROLES...
truncate table TB_R_ODB_ROLES;
prompt Truncating TB_R_CAR_INSURANCE...
truncate table TB_R_CAR_INSURANCE;
prompt Truncating TB_R_BATCH_QUEUE...
truncate table TB_R_BATCH_QUEUE;
prompt Truncating TB_M_ZIPCODES...
truncate table TB_M_ZIPCODES;
prompt Truncating TB_M_VEHICLE...
truncate table TB_M_VEHICLE;
prompt Truncating TB_M_SYSTEM...
truncate table TB_M_SYSTEM;
prompt Truncating TB_M_SEQ...
truncate table TB_M_SEQ;
prompt Truncating TB_M_PROVINCE...
truncate table TB_M_PROVINCE;
prompt Truncating TB_M_MODULE_H...
truncate table TB_M_MODULE_H;
prompt Truncating TB_M_MODULE_D...
truncate table TB_M_MODULE_D;
prompt Truncating TB_M_HIST_SEQ...
truncate table TB_M_HIST_SEQ;
prompt Truncating TB_M_DISTRICT...
truncate table TB_M_DISTRICT;
prompt Truncating TB_M_CUSTOMER_PERSONAL...
truncate table TB_M_CUSTOMER_PERSONAL;
prompt Truncating TB_M_CUSTOMER_COMPANY...
truncate table TB_M_CUSTOMER_COMPANY;
prompt Truncating TB_M_CALENDAR...
truncate table TB_M_CALENDAR;
prompt Truncating TB_M_BATCH...
truncate table TB_M_BATCH;
prompt Truncating TB_M_AMPHUR...
truncate table TB_M_AMPHUR;
prompt Truncating TB_L_LOGGER...
truncate table TB_L_LOGGER;
prompt Truncating TB_L_EXCEL_DOWNLOAD_FILE...
truncate table TB_L_EXCEL_DOWNLOAD_FILE;
prompt Truncating TB_L_BATCH_STATUS_LOG...
truncate table TB_L_BATCH_STATUS_LOG;
prompt Truncating HIBERNATE_SEQUENCES...
truncate table HIBERNATE_SEQUENCES;
prompt Loading HIBERNATE_SEQUENCES...
insert into HIBERNATE_SEQUENCES (sequence_name, sequence_next_hi_value)
values ('TB_L_LOGGER', 22);
commit;
prompt 1 records loaded
prompt Loading TB_L_BATCH_STATUS_LOG...
prompt Table is empty
prompt Loading TB_L_EXCEL_DOWNLOAD_FILE...
insert into TB_L_EXCEL_DOWNLOAD_FILE (doc_id, file_no, file_size, file_name, exec_start_dt, exec_end_dt, status, update_by, update_dt)
values ('D180400016', 1, 93381, 'LFP02540_20180420152303_R_1.zip', to_date('10-04-2019 15:23:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-04-2019 15:23:05', 'dd-mm-yyyy hh24:mi:ss'), '3', 'FIS04', to_timestamp('10-04-2019 15:23:05.140000', 'dd-mm-yyyy hh24:mi:ss.ff'));
commit;
prompt 1 records loaded
prompt Loading TB_L_LOGGER...
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 15:38:06', 'dd-mm-yyyy hh24:mi:ss'), 1, '99999', 'BW04', 'LBW04221', 'testUser', 'I', 'MSTD7000BINF', 'MSTD7000BINF: Calendar Download Begin', 'S');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 15:38:07', 'dd-mm-yyyy hh24:mi:ss'), 2, '99999', 'BW04', 'LBW04221', 'testUser', 'E', 'MBW00030BERR', 'MBW00030BERR: Report Name Data not found from TB_M_SYSTEM, CATEGORY=REPORT_NAME, SUB_CATEGORY=REPORT_NAME, CD=LBW04221, STATUS=Y.', 'P');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 15:38:07', 'dd-mm-yyyy hh24:mi:ss'), 3, '99999', 'BW04', 'LBW04221', 'testUser', 'E', 'MSTD7002BINF', 'MSTD7002BINF: Calendar Download End with error , , ', 'E');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 15:39:43', 'dd-mm-yyyy hh24:mi:ss'), 50, '99999', 'BW04', 'LBW04221', 'testUser', 'I', 'MSTD7000BINF', 'MSTD7000BINF: Calendar Download Begin', 'S');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 15:39:45', 'dd-mm-yyyy hh24:mi:ss'), 51, '99999', 'BW04', 'LBW04221', 'testUser', 'E', 'MSTD0067AERR', 'MSTD0067AERR: Undefined Error : ORA-00942: table or view does not exist' || chr(10) || '', 'P');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 15:39:45', 'dd-mm-yyyy hh24:mi:ss'), 52, '99999', 'BW04', 'LBW04221', 'testUser', 'E', 'MSTD7002BINF', 'MSTD7002BINF: Calendar Download End with error , , ', 'E');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 15:45:58', 'dd-mm-yyyy hh24:mi:ss'), 100, '99999', 'BW04', 'LBW04221', 'gwrds03', 'I', 'MSTD7000BINF', 'MSTD7000BINF: Calendar Download Begin', 'S');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 15:46:00', 'dd-mm-yyyy hh24:mi:ss'), 101, '99999', 'BW04', 'LBW04221', 'gwrds03', 'I', 'MSTD7001BINF', 'MSTD7001BINF: Calendar Download End successfully  File Name: Calendar_Master_Sep-18_D-14_201904051546156.xlsx, , ', 'E');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 15:46:44', 'dd-mm-yyyy hh24:mi:ss'), 150, '99999', 'BW04', 'LBW04221', 'gwrds03', 'I', 'MSTD7000BINF', 'MSTD7000BINF: Calendar Download Begin', 'S');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 15:46:46', 'dd-mm-yyyy hh24:mi:ss'), 151, '99999', 'BW04', 'LBW04221', 'gwrds03', 'I', 'MSTD7001BINF', 'MSTD7001BINF: Calendar Download End successfully  File Name: Calendar_Master_Sep-18_D-14_201904051546471.xlsx, , ', 'E');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 15:49:46', 'dd-mm-yyyy hh24:mi:ss'), 200, '99999', 'BW04', 'LBW04221', 'gwrds03', 'I', 'MSTD7000BINF', 'MSTD7000BINF: Calendar Download Begin', 'S');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 15:49:48', 'dd-mm-yyyy hh24:mi:ss'), 201, '99999', 'BW04', 'LBW04221', 'gwrds03', 'I', 'MSTD7001BINF', 'MSTD7001BINF: Calendar Download End successfully  File Name: Calendar_Master_Sep-18_D-14_201904051549332.xlsx, , ', 'E');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 16:16:35', 'dd-mm-yyyy hh24:mi:ss'), 250, '99999', 'BW04', 'LBW04221', 'gwrds03', 'I', 'MSTD7000BINF', 'MSTD7000BINF: Calendar Download Begin', 'S');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 16:16:37', 'dd-mm-yyyy hh24:mi:ss'), 251, '99999', 'BW04', 'LBW04221', 'gwrds03', 'I', 'MSTD7001BINF', 'MSTD7001BINF: Calendar Download End successfully  File Name: Calendar_Master_Sep-18_D-14_201904051616565.xlsx, , ', 'E');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 16:18:36', 'dd-mm-yyyy hh24:mi:ss'), 300, '99999', 'BW04', 'LBW04221', 'gwrds03', 'I', 'MSTD7000BINF', 'MSTD7000BINF: Calendar Download Begin', 'S');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 16:18:38', 'dd-mm-yyyy hh24:mi:ss'), 301, '99999', 'BW04', 'LBW04221', 'gwrds03', 'I', 'MSTD7001BINF', 'MSTD7001BINF: Calendar Download End successfully  File Name: Calendar_Master_Sep-18_D-14_201904051618432.xlsx, , ', 'E');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 16:22:57', 'dd-mm-yyyy hh24:mi:ss'), 350, '99999', 'BW04', 'LBW04221', 'gwrds03', 'I', 'MSTD7000BINF', 'MSTD7000BINF: Calendar Download Begin', 'S');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 16:23:01', 'dd-mm-yyyy hh24:mi:ss'), 351, '99999', 'BW04', 'LBW04221', 'gwrds03', 'I', 'MSTD7001BINF', 'MSTD7001BINF: Calendar Download End successfully  File Name: Calendar_Master_Sep-18_D-14_201904051623596.xlsx, , ', 'E');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 16:25:39', 'dd-mm-yyyy hh24:mi:ss'), 400, '99999', 'BW04', 'LBW04221', 'gwrds03', 'I', 'MSTD7000BINF', 'MSTD7000BINF: Calendar Download Begin', 'S');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 16:25:42', 'dd-mm-yyyy hh24:mi:ss'), 401, '99999', 'BW04', 'LBW04221', 'gwrds03', 'I', 'MSTD7001BINF', 'MSTD7001BINF: Calendar Download End successfully  File Name: Calendar_Master_Sep-18_D-14_201904051625891.xlsx, , ', 'E');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 16:29:14', 'dd-mm-yyyy hh24:mi:ss'), 450, '99999', 'BW04', 'LBW04221', 'gwrds03', 'I', 'MSTD7000BINF', 'MSTD7000BINF: Calendar Download Begin', 'S');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 16:29:17', 'dd-mm-yyyy hh24:mi:ss'), 451, '99999', 'BW04', 'LBW04221', 'gwrds03', 'I', 'MSTD7001BINF', 'MSTD7001BINF: Calendar Download End successfully  File Name: Calendar_Master_Sep-18_D-14_201904051629824.xlsx, , ', 'E');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 16:47:40', 'dd-mm-yyyy hh24:mi:ss'), 500, '99999', 'BW04', 'LBW04221', 'gwrds03', 'I', 'MSTD7000BINF', 'MSTD7000BINF: Calendar Download Begin', 'S');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 16:47:44', 'dd-mm-yyyy hh24:mi:ss'), 501, '99999', 'BW04', 'LBW04221', 'gwrds03', 'I', 'MSTD7001BINF', 'MSTD7001BINF: Calendar Download End successfully  File Name: Calendar_Master_Sep-18_D-14_201904051647519.xlsx, , ', 'E');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 16:48:12', 'dd-mm-yyyy hh24:mi:ss'), 550, '99999', 'BW04', 'LBW04221', 'gwrds03', 'I', 'MSTD7000BINF', 'MSTD7000BINF: Calendar Download Begin', 'S');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 16:48:14', 'dd-mm-yyyy hh24:mi:ss'), 551, '99999', 'BW04', 'LBW04221', 'gwrds03', 'I', 'MSTD7001BINF', 'MSTD7001BINF: Calendar Download End successfully  File Name: Calendar_Master_Sep-18_D-14_201904051648550.xlsx, , ', 'E');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 16:52:20', 'dd-mm-yyyy hh24:mi:ss'), 600, '99999', 'BW04', 'LBW04221', 'gwrds03', 'I', 'MSTD7000BINF', 'MSTD7000BINF: Calendar Download Begin', 'S');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 16:52:23', 'dd-mm-yyyy hh24:mi:ss'), 601, '99999', 'BW04', 'LBW04221', 'gwrds03', 'I', 'MSTD7001BINF', 'MSTD7001BINF: Calendar Download End successfully  File Name: Calendar_Master_Sep-18_D-14_201904051652768.xlsx, , ', 'E');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 17:06:01', 'dd-mm-yyyy hh24:mi:ss'), 650, '99999', 'BW04', 'LBW04221', 'gwrds03', 'I', 'MSTD7000BINF', 'MSTD7000BINF: Calendar Download Begin', 'S');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 17:06:03', 'dd-mm-yyyy hh24:mi:ss'), 651, '99999', 'BW04', 'LBW04221', 'gwrds03', 'I', 'MSTD7001BINF', 'MSTD7001BINF: Calendar Download End successfully  File Name: Calendar_Master_Sep-18_D-14_201904051706425.xlsx, , ', 'E');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 17:28:43', 'dd-mm-yyyy hh24:mi:ss'), 700, '99999', 'BW04', 'LBW04221', 'gwrds03', 'I', 'MSTD7000BINF', 'MSTD7000BINF: Calendar Download Begin', 'S');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 17:28:45', 'dd-mm-yyyy hh24:mi:ss'), 701, '99999', 'BW04', 'LBW04221', 'gwrds03', 'I', 'MSTD7001BINF', 'MSTD7001BINF: Calendar Download End successfully  File Name: Calendar_Master_Sep-18_D-14_201904051728308.xlsx, , ', 'E');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 17:39:05', 'dd-mm-yyyy hh24:mi:ss'), 750, '99999', 'BW04', 'LBW04221', 'gwrds03', 'I', 'MSTD7000BINF', 'MSTD7000BINF: Calendar Download Begin', 'S');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 17:39:08', 'dd-mm-yyyy hh24:mi:ss'), 751, '99999', 'BW04', 'LBW04221', 'gwrds03', 'I', 'MSTD7001BINF', 'MSTD7001BINF: Calendar Download End successfully  File Name: Calendar_Master_Sep-18_D-14_201904051739758.xlsx, , ', 'E');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 17:39:31', 'dd-mm-yyyy hh24:mi:ss'), 800, '99999', 'BW04', 'LBW04221', 'gwrds03', 'I', 'MSTD7000BINF', 'MSTD7000BINF: Calendar Download Begin', 'S');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 17:39:34', 'dd-mm-yyyy hh24:mi:ss'), 801, '99999', 'BW04', 'LBW04221', 'gwrds03', 'I', 'MSTD7001BINF', 'MSTD7001BINF: Calendar Download End successfully  File Name: Calendar_Master_Sep-18_D-14_201904051739161.xlsx, , ', 'E');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 17:40:51', 'dd-mm-yyyy hh24:mi:ss'), 850, '99999', 'BW04', 'LBW04221', 'gwrds03', 'I', 'MSTD7000BINF', 'MSTD7000BINF: Calendar Download Begin', 'S');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 17:40:53', 'dd-mm-yyyy hh24:mi:ss'), 851, '99999', 'BW04', 'LBW04221', 'gwrds03', 'I', 'MSTD7001BINF', 'MSTD7001BINF: Calendar Download End successfully  File Name: Calendar_Master_Sep-18_D-14_201904051740267.xlsx, , ', 'E');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 17:46:53', 'dd-mm-yyyy hh24:mi:ss'), 900, '99999', 'BW04', 'LBW04221', 'gwrds03', 'I', 'MSTD7000BINF', 'MSTD7000BINF: Calendar Download Begin', 'S');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 17:46:55', 'dd-mm-yyyy hh24:mi:ss'), 901, '99999', 'BW04', 'LBW04221', 'gwrds03', 'I', 'MSTD7001BINF', 'MSTD7001BINF: Calendar Download End successfully  File Name: Calendar_Master_Sep-18_D-14_201904051746111.xlsx, , ', 'E');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 17:48:08', 'dd-mm-yyyy hh24:mi:ss'), 950, '99999', 'BW04', 'LBW04221', 'gwrds03', 'I', 'MSTD7000BINF', 'MSTD7000BINF: Calendar Download Begin', 'S');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 17:48:10', 'dd-mm-yyyy hh24:mi:ss'), 951, '99999', 'BW04', 'LBW04221', 'gwrds03', 'I', 'MSTD7001BINF', 'MSTD7001BINF: Calendar Download End successfully  File Name: Calendar_Master_Sep-18_D-14_201904051748193.xlsx, , ', 'E');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 17:58:54', 'dd-mm-yyyy hh24:mi:ss'), 1000, '99999', 'BW04', 'LBW04221', 'gwrds03', 'I', 'MSTD7000BINF', 'MSTD7000BINF: Calendar Download Begin', 'S');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 17:58:56', 'dd-mm-yyyy hh24:mi:ss'), 1001, '99999', 'BW04', 'LBW04221', 'gwrds03', 'I', 'MSTD7001BINF', 'MSTD7001BINF: Calendar Download End successfully  File Name: Calendar_Master_Sep-18_D-14_201904051758582.xlsx, , ', 'E');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 18:11:36', 'dd-mm-yyyy hh24:mi:ss'), 1050, '99999', 'BW04', 'LBW04221', 'gwrds03', 'I', 'MSTD7000BINF', 'MSTD7000BINF: Calendar Download Begin', 'S');
insert into TB_L_LOGGER (d_hodtcre, n_seq_no, v_apl_id, v_module_id, v_function_id, v_usercre, v_message_type, v_message_code, v_message, v_status)
values (to_date('05-04-2019 18:11:38', 'dd-mm-yyyy hh24:mi:ss'), 1051, '99999', 'BW04', 'LBW04221', 'gwrds03', 'I', 'MSTD7001BINF', 'MSTD7001BINF: Calendar Download End successfully  File Name: Calendar_Master_Sep-18_D-14_201904051811121.xlsx, , ', 'E');
commit;
prompt 46 records loaded
prompt Loading TB_M_AMPHUR...
insert into TB_M_AMPHUR (amphur_code, amphur_name, amphur_name_eng, geo_id, province_code, create_by, create_dt, update_by, update_dt)
values ('0101', 'Dindang', 'Dindang', 0, '01', 'FIS', to_timestamp('03-05-2019 12:30:49.898000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'FIS', to_timestamp('03-05-2019 12:30:49.898000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_AMPHUR (amphur_code, amphur_name, amphur_name_eng, geo_id, province_code, create_by, create_dt, update_by, update_dt)
values ('0201', 'Muang', 'Muang', 0, '02', 'FIS', to_timestamp('03-05-2019 12:30:49.898000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'FIS', to_timestamp('03-05-2019 12:30:49.898000', 'dd-mm-yyyy hh24:mi:ss.ff'));
commit;
prompt 2 records loaded
prompt Loading TB_M_BATCH...
prompt Table is empty
prompt Loading TB_M_CALENDAR...
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('17-06-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('05-09-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('14-08-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('19-08-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('15-09-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('24-08-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('20-09-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('02-09-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('22-09-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('26-09-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('01-11-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('14-11-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('15-11-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('22-11-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('01-12-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('06-12-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('10-12-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('03-10-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('04-10-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('20-12-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('12-10-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('14-10-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('17-10-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('19-10-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('27-12-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('23-04-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('02-07-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('20-09-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('27-04-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('28-04-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('24-09-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('25-09-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('18-02-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('06-05-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('19-07-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('04-10-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('20-02-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('23-07-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('05-10-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('06-10-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('29-07-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('30-07-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('03-03-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('02-08-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('04-08-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('23-05-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('08-08-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('28-10-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('05-06-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('24-03-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('21-08-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('17-03-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('18-03-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('01-01-2018', 'dd-mm-yyyy'), 'H', 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('03-01-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('10-06-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('07-01-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('15-06-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('25-08-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('15-01-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('07-04-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('08-04-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('02-09-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('05-09-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('22-01-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('26-01-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('28-06-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('29-06-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('30-11-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('10-02-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('19-04-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('23-04-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('25-04-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('08-12-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('09-12-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('16-02-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('17-07-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('25-02-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('05-03-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('13-05-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('26-07-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('01-01-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('20-05-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('07-08-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('06-01-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('09-01-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('08-02-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('26-04-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('23-09-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('12-02-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('30-04-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('07-10-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('10-10-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('02-03-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('16-10-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('18-10-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('10-03-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('24-10-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('13-03-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('15-03-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('10-03-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('18-05-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('02-08-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('19-03-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('13-08-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('21-03-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('22-03-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('24-03-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('29-05-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('03-11-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('14-01-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('16-01-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('08-06-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('10-11-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('11-11-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('19-01-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('26-01-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('07-04-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('29-01-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('11-04-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('24-06-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('23-11-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('11-09-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('19-09-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('29-08-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('28-10-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('07-11-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('24-11-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('25-11-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('30-11-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('04-12-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('08-12-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('29-09-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('16-12-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('17-12-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('19-12-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('07-10-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('21-12-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('15-10-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('23-10-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('03-07-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('18-09-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('17-01-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('20-01-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('26-06-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('21-01-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('24-01-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('25-01-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('27-06-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('20-04-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('03-12-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('06-12-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('07-12-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('11-02-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('14-02-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('08-07-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('11-07-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('28-04-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('23-02-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('19-07-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('20-12-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('05-05-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('21-07-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('24-12-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('28-12-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('31-12-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('18-04-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('19-08-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('06-01-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('30-03-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('23-08-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('12-01-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('14-01-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('31-10-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('10-11-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('24-04-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('09-07-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('18-02-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('05-11-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('15-01-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('01-04-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('02-04-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('21-06-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('31-08-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('06-04-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('28-11-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('05-12-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('07-12-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('28-09-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('15-12-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('16-12-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('17-12-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('04-05-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('18-12-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('20-06-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('19-11-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('22-11-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('03-09-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('12-04-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('29-06-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('09-09-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('10-09-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('15-12-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('16-10-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('01-03-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('09-05-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('23-07-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('24-07-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('26-12-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('15-04-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('05-02-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('15-08-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('18-08-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('12-09-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('31-01-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('01-02-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('02-02-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('20-04-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('27-12-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('07-03-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('20-08-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('16-09-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('25-08-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('24-09-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('15-02-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('12-12-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('19-02-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('25-04-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('06-07-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('13-03-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('08-08-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('28-05-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('11-08-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('26-10-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('11-11-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('26-04-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('29-04-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('12-07-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('22-02-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('24-02-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('01-05-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('29-04-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('02-05-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('12-07-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('15-07-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('27-09-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('29-09-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('23-03-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('02-06-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('30-10-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('03-06-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('06-06-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('27-11-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('21-12-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('26-02-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('06-05-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('25-07-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('20-07-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('10-05-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('11-05-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('12-05-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('06-11-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('28-03-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('30-03-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('08-11-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('12-11-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('05-04-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('11-12-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('12-12-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('14-12-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('18-12-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('08-03-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('24-07-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('26-02-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('26-07-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('27-07-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('14-06-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('17-06-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('16-11-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('23-01-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('24-01-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('25-12-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('26-12-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('22-10-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('11-09-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('14-09-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('03-08-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('04-08-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('12-03-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('05-08-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('21-05-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('07-03-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('31-01-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('23-06-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('04-09-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('04-02-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('21-04-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('06-02-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('09-02-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('12-01-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('05-08-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('20-10-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('30-06-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('06-02-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('16-04-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('17-04-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('03-07-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('05-07-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('11-02-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('11-07-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('14-07-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('27-03-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('25-10-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('16-08-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('10-07-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('07-05-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('08-05-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('30-09-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('21-02-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('22-02-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('23-02-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('09-05-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('11-06-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('18-01-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('02-04-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('06-04-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('22-03-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('09-01-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('12-06-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('16-06-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('13-07-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('14-12-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('18-07-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('19-12-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('25-02-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('28-02-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('15-05-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('15-06-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('13-11-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('15-11-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('22-01-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('18-06-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('27-01-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('28-01-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('19-06-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('28-08-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('18-01-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('28-02-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('03-03-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('06-03-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('11-05-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('14-10-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('06-03-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('08-03-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('27-11-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('04-02-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('08-09-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('11-04-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('09-03-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('11-03-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('31-07-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('05-01-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('21-05-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('27-05-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('07-08-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('12-03-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('14-03-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('11-08-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('22-08-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('23-08-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('13-09-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('14-09-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('26-08-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('27-08-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('28-08-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('31-08-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('14-04-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('01-12-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('02-12-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('22-05-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('23-05-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('08-01-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('26-05-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('18-08-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('07-09-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('28-01-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('15-04-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('13-04-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('03-05-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('15-02-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('01-10-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('05-12-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('12-02-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('18-04-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('27-06-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('01-07-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('28-11-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('04-07-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('19-02-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('09-10-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('03-10-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('14-07-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('22-04-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('12-10-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('03-08-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('17-10-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('28-07-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('16-07-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('13-12-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('02-05-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('27-02-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('09-08-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('21-10-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('22-10-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('01-06-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('02-06-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('23-12-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('02-03-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('14-05-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('29-07-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('30-07-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('30-12-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('25-03-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('09-06-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('11-06-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('26-03-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('14-08-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('04-01-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('19-05-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('01-08-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('24-05-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('17-05-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('13-01-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('20-06-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('13-01-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('07-01-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('18-03-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('09-04-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('29-08-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('16-01-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('19-01-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('04-04-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('05-04-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('22-06-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('24-06-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('25-06-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('17-01-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('07-11-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('28-06-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('06-09-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('29-01-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('17-04-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('09-04-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('21-01-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('04-04-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('13-06-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('14-11-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('26-06-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('25-11-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('26-11-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('03-02-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('25-07-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('17-05-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('06-09-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('21-08-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('18-09-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('21-09-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('01-03-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('05-03-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('22-05-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('31-07-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('19-10-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('30-08-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('24-10-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('27-10-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('28-05-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('29-05-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('31-05-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('23-11-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('29-11-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('16-11-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('27-10-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('16-03-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('20-03-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('04-06-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('06-06-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('05-01-2018', 'dd-mm-yyyy'), 'H', 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('13-08-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('22-12-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('13-10-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('23-12-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('30-09-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('29-03-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('22-08-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('24-08-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('07-06-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('08-06-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('19-04-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('18-10-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('30-12-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('13-09-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('23-06-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('01-09-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('26-08-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('18-06-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('05-07-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('17-09-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('07-02-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('21-09-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('03-04-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('17-11-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('10-04-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('19-06-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('04-11-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('12-11-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('17-11-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('20-11-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('21-11-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('02-12-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('22-07-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('27-07-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('29-12-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('15-05-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('04-03-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('20-05-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('18-05-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('15-10-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('20-11-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('30-01-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('25-06-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('05-10-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('08-10-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('03-12-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('09-12-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('01-10-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('04-01-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('15-03-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('06-08-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('09-03-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('24-05-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('06-08-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('23-10-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('11-03-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('02-02-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('16-08-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('12-09-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('24-12-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('28-12-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('29-12-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('17-03-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('31-05-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('10-08-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('12-08-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('26-10-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('01-09-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('23-09-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('25-09-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('25-10-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('29-10-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('15-09-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('03-02-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('22-04-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('19-09-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('24-04-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('07-07-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('09-07-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('10-07-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('02-11-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('26-03-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('04-06-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('29-03-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('09-06-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('15-08-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('28-03-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('02-11-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('18-11-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('19-11-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('22-09-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('13-02-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('14-02-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('13-07-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('26-09-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('28-09-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('16-02-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('16-06-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('13-06-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('14-06-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('03-04-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('02-10-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('06-10-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('16-07-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('02-10-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('13-05-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('08-04-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('21-06-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('12-04-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('13-04-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('14-04-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('30-08-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('04-09-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('23-01-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('10-04-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('10-10-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('27-02-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('16-05-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('11-10-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('13-10-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('19-05-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('24-11-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('01-02-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('03-09-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('17-08-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('07-09-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('10-09-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('30-06-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('08-09-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('27-01-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('30-01-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('16-04-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('01-07-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('05-02-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('01-08-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('25-05-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('26-05-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('17-09-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('09-02-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('01-05-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('30-05-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('29-10-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('19-03-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('03-06-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('30-10-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('03-11-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('05-11-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('06-11-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('08-11-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('09-11-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('13-11-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('21-04-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('07-07-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('10-12-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('17-02-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('27-04-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('17-02-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('04-05-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('17-07-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('02-01-2018', 'dd-mm-yyyy'), 'H', 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('21-03-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('23-03-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('17-08-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('20-08-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('08-01-2018', 'dd-mm-yyyy'), 'H', 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('10-01-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('27-03-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('26-11-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('27-09-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('13-12-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('20-02-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('03-05-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('20-07-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('20-03-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('25-05-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('27-05-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('12-08-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('25-03-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('30-05-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('01-11-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('11-01-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('31-03-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('27-08-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('09-10-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('11-10-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('20-10-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('21-10-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('07-05-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('22-12-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('25-12-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('04-03-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('10-05-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('12-05-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('04-11-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('31-03-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('01-04-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('10-06-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('12-06-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('09-11-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('31-12-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('04-07-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('16-09-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('28-07-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('16-05-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('02-01-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('03-01-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('20-01-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('25-01-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('29-11-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('08-07-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('10-02-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('14-03-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('16-03-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('09-08-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('10-01-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('22-06-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('18-11-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('21-11-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('07-02-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('08-02-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('02-07-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('06-07-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('04-12-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('13-02-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('05-05-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('18-07-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('10-08-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('11-01-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('01-06-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('31-10-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('09-09-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('11-12-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('30-04-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('15-07-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('21-07-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('22-07-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('08-10-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('24-02-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('14-05-2018', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('05-06-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('07-06-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('21-02-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_CALENDAR (getsudo_month, timing, plant, calendar_date, calendar_flag, plant_type, create_by, create_dt, update_by, update_dt)
values ('Sep-18', 'D-14', 'TDEM', to_date('08-05-2019', 'dd-mm-yyyy'), null, 'H', 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gwrds03', to_timestamp('30-08-2018 14:08:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
commit;
prompt 730 records loaded
prompt Loading TB_M_CUSTOMER_COMPANY...
prompt Table is empty
prompt Loading TB_M_CUSTOMER_PERSONAL...
prompt Table is empty
prompt Loading TB_M_DISTRICT...
insert into TB_M_DISTRICT (district_code, district_name, district_name_eng, amphur_code, province_code, geo_id, create_by, create_dt, update_by, update_dt)
values ('010101', 'Dub Dindang', 'Dub Dindang', '0101', '01', 0, 'FIS', to_timestamp('03-05-2019 12:30:49.898000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'FIS', to_timestamp('03-05-2019 12:30:49.898000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_DISTRICT (district_code, district_name, district_name_eng, amphur_code, province_code, geo_id, create_by, create_dt, update_by, update_dt)
values ('020101', 'Sub Muang', 'Sub Muang', '0201', '02', 0, 'FIS', to_timestamp('03-05-2019 12:30:49.898000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'FIS', to_timestamp('03-05-2019 12:30:49.898000', 'dd-mm-yyyy hh24:mi:ss.ff'));
commit;
prompt 2 records loaded
prompt Loading TB_M_HIST_SEQ...
prompt Table is empty
prompt Loading TB_M_MODULE_D...
prompt Table is empty
prompt Loading TB_M_MODULE_H...
prompt Table is empty
prompt Loading TB_M_PROVINCE...
insert into TB_M_PROVINCE (province_code, province_name, province_name_eng, geo_id, create_by, create_dt, update_by, update_dt)
values ('01', 'Bangkok', 'Bangkok', 0, 'FIS', to_timestamp('03-05-2019 12:30:49.898000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'FIS', to_timestamp('03-05-2019 12:30:49.898000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_PROVINCE (province_code, province_name, province_name_eng, geo_id, create_by, create_dt, update_by, update_dt)
values ('02', 'Nonthaburee', 'Nonthaburee', 0, 'FIS', to_timestamp('03-05-2019 12:30:49.898000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'FIS', to_timestamp('03-05-2019 12:30:49.898000', 'dd-mm-yyyy hh24:mi:ss.ff'));
commit;
prompt 2 records loaded
prompt Loading TB_M_SEQ...
prompt Table is empty
prompt Loading TB_M_SYSTEM...
insert into TB_M_SYSTEM (category, sub_category, cd, value, remark, status, create_by, create_dt, update_by, update_dt)
values ('LIST', 'FIN_TYPE_PURCHASE', 'F', 'Finance', null, 'Y', 'fis04', to_timestamp('03-05-2019 12:32:35.285000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'fis04', to_timestamp('03-05-2019 12:32:35.285000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_SYSTEM (category, sub_category, cd, value, remark, status, create_by, create_dt, update_by, update_dt)
values ('LIST', 'BRAND', 'B01', 'Toyota', null, 'Y', 'fis04', to_timestamp('03-05-2019 12:30:49.898000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'fis04', to_timestamp('21-05-2019 09:53:26.296000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_SYSTEM (category, sub_category, cd, value, remark, status, create_by, create_dt, update_by, update_dt)
values ('LIST', 'FIN_LEASING_COMPANY', 'L01', 'Toyota Leasing', null, 'Y', 'fis04', to_timestamp('03-05-2019 12:34:03.524000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'fis04', to_timestamp('21-05-2019 10:24:34.902000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_SYSTEM (category, sub_category, cd, value, remark, status, create_by, create_dt, update_by, update_dt)
values ('LIST', 'FIN_TYPE_PURCHASE', 'C', 'Cash', null, 'Y', 'fis04', to_timestamp('03-05-2019 12:32:50.557000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'fis04', to_timestamp('03-05-2019 12:32:50.557000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_SYSTEM (category, sub_category, cd, value, remark, status, create_by, create_dt, update_by, update_dt)
values ('LIST', 'INS_CLASS', 'C01', '1st class', null, 'Y', 'fis04', to_timestamp('03-05-2019 12:35:19.701000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'fis04', to_timestamp('03-05-2019 12:35:19.701000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_SYSTEM (category, sub_category, cd, value, remark, status, create_by, create_dt, update_by, update_dt)
values ('LIST', 'INS_CLASS', 'C02', '2nd class', 'Update2 Configuration for authorized to access each report by company : All / TDEM / TMAP-MS', 'Y', 'fis04', to_timestamp('03-05-2019 12:36:20.481000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'fis04', to_timestamp('22-05-2019 14:02:03.834000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_SYSTEM (category, sub_category, cd, value, remark, status, create_by, create_dt, update_by, update_dt)
values ('LIST', 'INS_CLASS', 'C03', '3rd class', null, 'Y', 'fis04', to_timestamp('03-05-2019 12:36:39.504000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'fis04', to_timestamp('03-05-2019 12:36:39.504000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_SYSTEM (category, sub_category, cd, value, remark, status, create_by, create_dt, update_by, update_dt)
values ('LIST', 'INS_TYPE', 'T', 'T. Care', null, 'Y', 'fis04', to_timestamp('03-05-2019 12:53:33.367000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'fis04', to_timestamp('03-05-2019 12:53:33.367000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_SYSTEM (category, sub_category, cd, value, remark, status, create_by, create_dt, update_by, update_dt)
values ('LIST', 'INS_TYPE', 'N', 'None T. Care', null, 'Y', 'fis04', to_timestamp('03-05-2019 12:53:56.664000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'fis04', to_timestamp('03-05-2019 12:53:56.664000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_SYSTEM (category, sub_category, cd, value, remark, status, create_by, create_dt, update_by, update_dt)
values ('LIST', 'INS_PREMIUM_TYPE', '01', 'Convini', null, 'Y', 'fis04', to_timestamp('03-05-2019 12:58:02.685000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'fis04', to_timestamp('03-05-2019 12:58:02.685000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_SYSTEM (category, sub_category, cd, value, remark, status, create_by, create_dt, update_by, update_dt)
values ('LIST', 'GENDER', 'M', 'Male', null, 'Y', 'fis04', to_timestamp('03-05-2019 12:58:31.414000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'fis04', to_timestamp('03-05-2019 12:58:31.414000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_SYSTEM (category, sub_category, cd, value, remark, status, create_by, create_dt, update_by, update_dt)
values ('LIST', 'GENDER', 'F', 'Female', null, 'Y', 'fis04', to_timestamp('03-05-2019 12:58:52.605000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'fis04', to_timestamp('03-05-2019 12:58:52.605000', 'dd-mm-yyyy hh24:mi:ss.ff'));
commit;
prompt 12 records loaded
prompt Loading TB_M_VEHICLE...
insert into TB_M_VEHICLE (veh_brand, veh_vin_no, veh_series, veh_model, veh_color, veh_year, veh_reg_no, veh_engine, veh_weight, veh_cc, veh_type, create_by, create_dt, update_by, update_dt)
values ('TOYOTA', 'MR053REH100010123', 'CH-R', 'HI', 'Red', '2019', 'RED PLATE', '4S-F4567', '1,200 Kg', '1,800 CC', 'Sub SUV', 'SYSTEM', to_timestamp('22-05-2019 12:36:39.504000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'SYSTEM', to_timestamp('22-05-2019 12:36:39.504000', 'dd-mm-yyyy hh24:mi:ss.ff'));
commit;
prompt 1 records loaded
prompt Loading TB_M_ZIPCODES...
insert into TB_M_ZIPCODES (zipcode, district_code, create_by, create_dt, update_by, update_dt)
values ('10400', '010101', 'FIS', to_timestamp('03-05-2019 12:30:49.898000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'FIS', to_timestamp('03-05-2019 12:30:49.898000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into TB_M_ZIPCODES (zipcode, district_code, create_by, create_dt, update_by, update_dt)
values ('11111', '020101', 'FIS', to_timestamp('03-05-2019 12:30:49.898000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'FIS', to_timestamp('03-05-2019 12:30:49.898000', 'dd-mm-yyyy hh24:mi:ss.ff'));
commit;
prompt 2 records loaded
prompt Loading TB_R_BATCH_QUEUE...
prompt Table is empty
prompt Loading TB_R_CAR_INSURANCE...
prompt Table is empty
prompt Loading TB_R_ODB_ROLES...
insert into TB_R_ODB_ROLES (doc_id, create_dt, role_id, id)
values ('D180400016', to_timestamp('10-04-2019 15:22:38.254000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'ADMIN.tmap-em.toyota.co.th.asia', 'D180400016ADMIN.tmap-em.toyota.co.th.asia');
commit;
prompt 1 records loaded
