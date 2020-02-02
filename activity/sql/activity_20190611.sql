/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.7.24 : Database - activiti
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`activiti` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `activiti`;

/*Table structure for table `act_evt_log` */

DROP TABLE IF EXISTS `act_evt_log`;

CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_evt_log` */

/*Table structure for table `act_ge_bytearray` */

DROP TABLE IF EXISTS `act_ge_bytearray`;

CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_bytearray` */

insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('2',1,'D:\\openSource\\Learn.demo\\activity\\target\\classes\\processes\\basic2.bpmn','1','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<!--\r\n* Copyright 2012-2014 the original author or authors.\r\n*\r\n* Licensed under the Apache License, Version 2.0 (the \"License\");\r\n* you may not use this file except in compliance with the License.\r\n* You may obtain a copy of the License at\r\n*\r\n*      http://www.apache.org/licenses/LICENSE-2.0\r\n*\r\n* Unless required by applicable law or agreed to in writing, software\r\n* distributed under the License is distributed on an \"AS IS\" BASIS,\r\n* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.\r\n* See the License for the specific language governing permissions and\r\n* limitations under the License.\r\n-->\r\n<definitions id=\"processDefinitions\"\r\n             xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\"\r\n             xmlns:activiti=\"http://activiti.org/bpmn\"\r\n             targetNamespace=\"processDefinitions\">\r\n\r\n    <process id=\"waiter2\">\r\n\r\n        <startEvent id=\"start\"/>\r\n\r\n        <sequenceFlow id=\"flow1\" sourceRef=\"start\" targetRef=\"service1\"/>\r\n\r\n        <scriptTask id=\"service1\" scriptFormat=\"groovy\">\r\n            <script>\r\n               println \'customerId=\' + customerId\r\n            </script>\r\n        </scriptTask>\r\n\r\n        <sequenceFlow id=\"flow2\" sourceRef=\"service1\" targetRef=\"end\"/>\r\n\r\n        <endEvent id=\"end\"/>\r\n\r\n    </process>\r\n\r\n</definitions>',0),('20002',1,'/Users/lsp/workcode/openSource/com.yss.sofa.simpleflow/target/classes/processes/basic.bpmn20.xml','20001','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<!--\r\n* Copyright 2012-2014 the original author or authors.\r\n*\r\n* Licensed under the Apache License, Version 2.0 (the \"License\");\r\n* you may not use this file except in compliance with the License.\r\n* You may obtain a copy of the License at\r\n*\r\n*      http://www.apache.org/licenses/LICENSE-2.0\r\n*\r\n* Unless required by applicable law or agreed to in writing, software\r\n* distributed under the License is distributed on an \"AS IS\" BASIS,\r\n* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.\r\n* See the License for the specific language governing permissions and\r\n* limitations under the License.\r\n-->\r\n<definitions id=\"processDefinitions\"\r\n             xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\"\r\n             xmlns:activiti=\"http://activiti.org/bpmn\"\r\n             targetNamespace=\"processDefinitions\">\r\n\r\n    <process id=\"waiter\">\r\n\r\n        <startEvent id=\"start\"/>\r\n\r\n        <sequenceFlow id=\"flow1\" sourceRef=\"start\" targetRef=\"service1\"/>\r\n\r\n        <scriptTask id=\"service1\" scriptFormat=\"groovy\">\r\n            <script>\r\n               println \'customerId=\' + customerId\r\n            </script>\r\n        </scriptTask>\r\n\r\n        <sequenceFlow id=\"flow2\" sourceRef=\"service1\" targetRef=\"end\"/>\r\n\r\n        <endEvent id=\"end\"/>\r\n\r\n    </process>\r\n\r\n</definitions>',0),('20003',1,'/Users/lsp/workcode/openSource/com.yss.sofa.simpleflow/target/classes/processes/basic2.bpmn','20001','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<!--\r\n* Copyright 2012-2014 the original author or authors.\r\n*\r\n* Licensed under the Apache License, Version 2.0 (the \"License\");\r\n* you may not use this file except in compliance with the License.\r\n* You may obtain a copy of the License at\r\n*\r\n*      http://www.apache.org/licenses/LICENSE-2.0\r\n*\r\n* Unless required by applicable law or agreed to in writing, software\r\n* distributed under the License is distributed on an \"AS IS\" BASIS,\r\n* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.\r\n* See the License for the specific language governing permissions and\r\n* limitations under the License.\r\n-->\r\n<definitions id=\"processDefinitions\"\r\n             xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\"\r\n             xmlns:activiti=\"http://activiti.org/bpmn\"\r\n             targetNamespace=\"processDefinitions\">\r\n\r\n    <process id=\"waiter2\">\r\n\r\n        <startEvent id=\"start\"/>\r\n\r\n        <sequenceFlow id=\"flow1\" sourceRef=\"start\" targetRef=\"service1\"/>\r\n\r\n        <scriptTask id=\"service1\" scriptFormat=\"groovy\">\r\n            <script>\r\n               println \'customerId=\' + customerId\r\n            </script>\r\n        </scriptTask>\r\n\r\n        <sequenceFlow id=\"flow2\" sourceRef=\"service1\" targetRef=\"end\"/>\r\n\r\n        <endEvent id=\"end\"/>\r\n\r\n    </process>\r\n\r\n</definitions>',0),('22502',1,'vacationRequest.bpmn20.xml','22501','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://activiti.org/bpmn20\">\n  <process id=\"vacationRequest\" name=\"Vacation request\" isExecutable=\"true\">\n    <startEvent id=\"request\" activiti:initiator=\"employeeName\">\n      <extensionElements>\n        <activiti:formProperty id=\"numberOfDays\" name=\"Number of days\" type=\"long\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"startDate\" name=\"First day of holiday (dd-MM-yyy)\" type=\"date\" datePattern=\"dd-MM-yyyy hh:mm\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"vacationMotivation\" name=\"Motivation\" type=\"string\"></activiti:formProperty>\n      </extensionElements>\n    </startEvent>\n    <sequenceFlow id=\"flow1\" sourceRef=\"request\" targetRef=\"handleRequest\"></sequenceFlow>\n    <userTask id=\"handleRequest\" name=\"Handle vacation request\" activiti:candidateGroups=\"management,admin\">\n      <documentation>${employeeName} would like to take ${numberOfDays} day(s) of vacation (Motivation: ${vacationMotivation}).</documentation>\n      <extensionElements>\n        <activiti:formProperty id=\"vacationApproved\" name=\"Do you approve this vacation\" type=\"enum\" required=\"true\">\n          <activiti:value id=\"true\" name=\"Approve\"></activiti:value>\n          <activiti:value id=\"false\" name=\"Reject\"></activiti:value>\n        </activiti:formProperty>\n        <activiti:formProperty id=\"managerMotivation\" name=\"Motivation\" type=\"string\"></activiti:formProperty>\n      </extensionElements>\n    </userTask>\n    <exclusiveGateway id=\"requestApprovedDecision\" name=\"Request approved?\"></exclusiveGateway>\n    <sequenceFlow id=\"flow3\" sourceRef=\"requestApprovedDecision\" targetRef=\"sendApprovalMail\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${vacationApproved == \'true\'}]]></conditionExpression>\n    </sequenceFlow>\n    <manualTask id=\"sendApprovalMail\" name=\"Send confirmation e-mail\"></manualTask>\n    <sequenceFlow id=\"flow4\" sourceRef=\"sendApprovalMail\" targetRef=\"theEnd1\"></sequenceFlow>\n    <endEvent id=\"theEnd1\"></endEvent>\n    <sequenceFlow id=\"flow5\" sourceRef=\"requestApprovedDecision\" targetRef=\"adjustVacationRequestTask\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${vacationApproved == \'false\'}]]></conditionExpression>\n    </sequenceFlow>\n    <userTask id=\"adjustVacationRequestTask\" name=\"Adjust vacation request\" activiti:assignee=\"${employeeName}\">\n      <documentation>Your manager has disapproved your vacation request for ${numberOfDays} days.\n        Reason: ${managerMotivation}</documentation>\n      <extensionElements>\n        <activiti:formProperty id=\"numberOfDays\" name=\"Number of days\" type=\"long\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"startDate\" name=\"First day of holiday (dd-MM-yyy)\" type=\"date\" datePattern=\"dd-MM-yyyy hh:mm\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"vacationMotivation\" name=\"Motivation\" type=\"string\"></activiti:formProperty>\n        <activiti:formProperty id=\"resendRequest\" name=\"Resend vacation request to manager?\" type=\"enum\" required=\"true\">\n          <activiti:value id=\"true\" name=\"Yes\"></activiti:value>\n          <activiti:value id=\"false\" name=\"No\"></activiti:value>\n        </activiti:formProperty>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"flow6\" sourceRef=\"adjustVacationRequestTask\" targetRef=\"resendRequestDecision\"></sequenceFlow>\n    <exclusiveGateway id=\"resendRequestDecision\" name=\"Resend request?\"></exclusiveGateway>\n    <sequenceFlow id=\"flow8\" sourceRef=\"resendRequestDecision\" targetRef=\"theEnd2\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${resendRequest == \'false\'}]]></conditionExpression>\n    </sequenceFlow>\n    <endEvent id=\"theEnd2\"></endEvent>\n    <sequenceFlow id=\"flow7\" sourceRef=\"resendRequestDecision\" targetRef=\"handleRequest\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${resendRequest == \'true\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow2\" sourceRef=\"handleRequest\" targetRef=\"requestApprovedDecision\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_vacationRequest\">\n    <bpmndi:BPMNPlane bpmnElement=\"vacationRequest\" id=\"BPMNPlane_vacationRequest\">\n      <bpmndi:BPMNShape bpmnElement=\"request\" id=\"BPMNShape_request\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"0.0\" y=\"178.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"handleRequest\" id=\"BPMNShape_handleRequest\">\n        <omgdc:Bounds height=\"60.0\" width=\"100.0\" x=\"80.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"requestApprovedDecision\" id=\"BPMNShape_requestApprovedDecision\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"230.0\" y=\"114.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sendApprovalMail\" id=\"BPMNShape_sendApprovalMail\">\n        <omgdc:Bounds height=\"60.0\" width=\"100.0\" x=\"320.0\" y=\"0.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"theEnd1\" id=\"BPMNShape_theEnd1\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"475.0\" y=\"15.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"adjustVacationRequestTask\" id=\"BPMNShape_adjustVacationRequestTask\">\n        <omgdc:Bounds height=\"60.0\" width=\"100.0\" x=\"320.0\" y=\"160.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"resendRequestDecision\" id=\"BPMNShape_resendRequestDecision\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"470.0\" y=\"233.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"theEnd2\" id=\"BPMNShape_theEnd2\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"560.0\" y=\"238.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\">\n        <omgdi:waypoint x=\"30.0\" y=\"193.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"80.0\" y=\"193.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"180.0\" y=\"182.51612903225805\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"192.0\" y=\"180.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"192.0\" y=\"134.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"230.0\" y=\"134.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"270.0\" y=\"134.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"282.0\" y=\"134.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"282.0\" y=\"30.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"320.0\" y=\"30.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\">\n        <omgdi:waypoint x=\"420.0\" y=\"30.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"432.0\" y=\"30.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"432.0\" y=\"30.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"475.00215401185983\" y=\"29.24557624540596\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\">\n        <omgdi:waypoint x=\"270.0\" y=\"134.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"282.0\" y=\"134.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"282.0\" y=\"190.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"320.0\" y=\"190.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\">\n        <omgdi:waypoint x=\"420.0\" y=\"190.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"432.0\" y=\"190.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"432.0\" y=\"253.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"470.0\" y=\"253.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow7\" id=\"BPMNEdge_flow7\">\n        <omgdi:waypoint x=\"470.0\" y=\"253.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"127.0\" y=\"253.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"128.5\" y=\"223.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow8\" id=\"BPMNEdge_flow8\">\n        <omgdi:waypoint x=\"509.7647058823529\" y=\"252.76470588235293\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"560.0009919580556\" y=\"252.1666548576422\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('22503',1,'vacationRequest.vacationRequest.png','22501','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0V\0\0\0\0\0��0\0\0\"GIDATx���p����h�Z˱�U��Zv�9��3c{<�d�8*zX��,$5xA��\"�&��8\Z�ڎW���T-`.�����%��p��1B$$>�����򺛽����3�lv�͆��y���y�y\n\0 O)�����>�f͚���������p��թ���Ou8\"\0p1	U���*���>*K��ѡ^{�:d��\0�����P�p�W[[��Q	\0�K����9���A�J\0\0\\J��h�G%\0\0y�z�W[ת�kR[�/&�\0\0@���k�&��ݿ��Wܦֿ2ݨ����V\0\0 �`��ݥ�[��f��)��>C��}\\}�wA�`\0\0������e��#U���J��G�w���o�V\0\0���Q��aCU�b��\n\0\0����=�պv�j{�������kU��$�\0\0�x�U����v�\n\0\0�U<�j����\'o>vDmY�����.�`\0\0�ʬ\r�nJ��jò�j_�V�\n\0\0��Ymo?5D}�p�7>(�X��?% �VRR�c��;yܸq���XW�.�뀮6���u�lG�\0�\"X���f�>��d������\"�UR|>�h]���BA*�Z��Њ\0�VR���uw�0�w����B(\"X%D��a:-�#L��f��s�\0��`E����������YCRII��={�jhhP۶mS���Sb������]�^�Z��Ԩ�����U7�W\0\0����J��b�Y�U0T����2���Y���WЪ\0+*o���TYCUEE��;�y�����ኞ+\0\0����`%s��������}��a���j���pZ7\0�`E���`�CU���*�Pe\rW���fZ7\0�`E���`%K*X�T%:�7а�u�C�\0\0��*��U�zd�y:,Z��^+\0\0��rg��x<��\0s��z�@��J��u�U���LK��OږbF+\0��w@ׅ+�U:Ip�\0��z�t������]��;���S�$�\\Y��4�\0�T���Lj���+�U�z�N�-�)���Ks�ڎ�g�m\Z�\Z�dQ�ﳔ�\0 e��R���`�Vi8��P��X�*��zҺ���n�=�s6\0\0����!B��*]ǚ5���1�O�-�`�A�l\0\0�ț����<�12$��$�L�������]����ǎ�������N�Q�����R},\\��Z]7�Q�m���ϛ��F����>��F�^��%]��}\r1k���g���8\0@~���[�ծ]�r2X%���\'����ԵK�6]�u}��]]o�Z%!H�P(-����q]�_�=���]>駷��k��k�\Z|�BaLB�(	i�\"�^�5d��Z����\0�.X9$ȭ�������̙�N<�Dٗ��3�T3f�`(0��v�-PuI+++;ֲ\rs�\0\09��T&7���{�TW]u��ɲɓ\'������{l�Y>X���0��@\0@N�7�R\"�@��`�y�fu�QGI��z�wTww�Z�|�q?�*��v��Ŋ���`+\0�ۃU�*7+)�\Z4h��Su��g�;�S�����(\\������Ƀ�Xy=|���\0@��\n7N^�!���\nu�Yg����`�\\+\0@�rP=���jĈ�����^>�u�i���\\�F��Gz�R=�]~����ʲf[�3\0�VJ��G�F��/^�*++��믿^�����S�����G�M�rD;Xi�uL������!koU�ap\0\0�*����<��?�|c������b�O�I�Z�dI��+G��a��$\'�$TUWW[�Uu�|��u\0�`E��c�PyCe�u��z��̉�f�U�Â�<[OC�\0@�\"XQ��B��\Z�dΕLh�O����?��n�SZ�t&g\0 X���\nVfϕ��n\rF�d�+YDTz��aB靔�ehw��������m\\�dNg\Z\0 X���V�v1̺C��̜*\0 X���V��1&������O�\0��`E��u����`[����u�˵��25��\0+�E�\0�`E�\0\0 X�V\0\0�V+\0\0@��V\0\0�(�\0\0+��\n\0\0���\"X\0@��V\0\0�V+\0\0V+�\0\0 XQ+\0\0� X���h�St�:Hk\0������iW0$�8�������U�\0\0�����K\Z?߳gO�&{=U�����\ZCk\0���J�7����ڵ2%s|�����B\0\09�\0\0\0V\0\0\0+\0\0\0�\0\0\0V\0\0\0+\0\0\0�\0\0\0V\0\0\0+\0\0\0�\0\0\0V\0\0\0+\0\0\0�\0\0\0�\n\0\0\0+\0\0\0�\0\0\0�\n\0\0\0+\0\0\0�\0\0\0�\n\0\0�`\0\0\0�\0\0\0�\n\0\0�`\0\0\0�\0\0\0�\n\0\0�`\0\0@�\0\0\0�\n\0\0�`\0\0@�\0\0 X\0\0�`\0\0@�\0\0 X\0\0�`\0\0@�\0\0 X\0\0�\0\0\0@�\0\0 X\0\0�\0\0\0V\0\0\0 X\0\0�\0\0\0V\0\0\0 X\0\0�\0\0\0V\0\0\0+\0\0\0�\0\0\0V\0\0\0	J�\0\0H^�.�J�\0\0H�H]]�jB_�	V\0\0\0��*3LI�UG6��\n\0\0�R��v?�\n\0\0 ��(��|<cs�V\0\0�͡*Zh�h��\n\0\0��Ȃ�z��ݞ`\0\0�*T\'��t�+�\0\0��P����\0\0@N�6Q=�?�`\0\0\\�R5����+�\0\0p2���A�JC_�a^Z&��\0\0��CU�%=Z���\0�#\\Ez^���\n\0\0�!T��P8Rq�+k�2k���ι\"X\0\0��v���U��	�}��\\�\0\0@��|�Z]&���K��U�����\Z$X\0����!%���^��b\r7��U�����I�\\�\0\0@ڂ���E���w8.R�\Z�`�2%5�`\0\02��{���D�8�W�U��>+\0\0��`e��\n\r&���p�*�PeWE�����\0�������\0T��?O���=UC�\'�&�G\0\0y���z������!�M��\\�@=V�,\"jG�\0\0pl��*{��.H��D�s�\0\0�#��>�ot�@.���CiI�p�\n�\'\\�@\0\0�`5PU�p-�D[�*��M�,`+\0\0�Co��z�b]�3�peG�Γ�\0\0��\r?R�U�+��\Z����g�\0\0����\\ه�J�_�*\\��`{��\\��`\0\0�����:��\Z��Y�3��Rr�e�\0\0+��J(�P�\n��%�~�\n\0\0�UN��d�fd?\0��y�OU�JuH#X\0@�r�d���2�G�\0�`��po�S�\'��\0\0 X�x���:�G�\0�`�/�J.S���+\0\0��o�E��T4���\nU+\0\0Vn��*c�+\0\0V����V\0\0�r-\\�d+T�\0\0 X��S�\nҼ��\0\0�U���e?\0\0����\0\0�7|��\0�\r�g\0\0�>�\0\0���~��Ԑ���g׬Ys���^���R���:������\0-\0xÇ�������fU__�����P����^���Z\0�7|�t?KO��1᪯������9��=�@���`%m�P���� ��s%�{(�`���J�9��Q����;��=�@�\"X�rl}��.պv����v���G�#XH1��=�@�\"XE;������+nS�_�~D�}��` �R�<1�Vю����Pe֎���V\0��J X���~[V΍��1��\n@�O�%�V�\rV��VEV��` �\'f�V+�E���3C	+��{���Gj���`��x91�V1�ߏW����c�;�\0�\'f��*���پA��j�7ۮ�O���\0d���P��`��B��z�mW���\0d���P��`��`�۫>~�/�l��>y�vG���3C	+��;��,��i�}�0��X2�` ��2�@�\"X�+X���]7����1T�%�ȶ�^���)��ݰaä\'�x�9s��������)9Y������[n��u�ܹu������\Z���R�{E��\nT�=�ܓw�q��)S��|P�Y�F����(!_���z��^���W7�pÖ���+V%��`K/�@�W�C��Pg͚�;}�t#4:tH���w�U3g�<4iҤ��sV^+�yb5j��cǎ���f�7�U򆯏�ch�+�\rUf�	V���jȋ/��p�UW��K����/_�&N�ؓ˽W%8��&Hu�j�u���t�:�VO��V@�BUcc��]w�ڴi�J�-[�(�z���k�%X1���Z�l�\"H�V+���JB�̙J%�y������.����������Uii�\"H�V+ �dN�����*\\�Մ	�t�\Z�����^�X��3���K��K>�w���ɜ�tz�WzJJJ� XQ��	V�����u!��dŒ%K��O�}��*ݮ��ݹ4$ȉ�3�����$`y��h��_ ��U�N�,��	�ׯ�˥^+N̜���`e�e�z�h��_ �dEu���̲\n�8q�n}�����P\'f�T������k�/�H9�L�#�<�2����]}����7�81#����K�5����\\�O.S�I����}b[�`�P\'fd$�d�h�ΪD�i]p���]�2\Z�v���\rb��J X��An���-.,,�l�ݸq�\Z4h�:��Uwww����T_|񅪫�3n�B������Yi_�~m����PVV�A�L���\r����f(�`���#U*�0����QGe���~:�`�}�v%S/�nݚ�k���?K~F��V&^�`��9e�S�J X!���>�o�=P%��ß��\'҃��<�L5bĈ#��G���su�9�������j����?��Z�r���9�������q{߾}���/W?�я��?m�4�~��0~����}��O�]v�*..��>���\"���)S�駟n��]z饪��Ӹ��VÆ\r3~^II�����#n?�k�\0���ү2�c��ӳ��=VI\r%���0NN�����ܗ�_���,\'o��d�Ǆ�t\'�j�a{�R����v��K/��n���裏�ǤWJ�����SO�$�P�}Xp����;���q[z��=�X��Ԥ,X�.��\"c��0�3q�D�����;����c�{�رC\r2D͙3G���[���VO<�|p����S�~���ַ�e����v��ǫ?����	V��u�]ח�9V;w����9V)J��`�����h��x<�����Z�j�z�g�c��o4{衇��7o�l|?~�����ڵk�p&�C�|�Wk�����a�#9��{��裏6�����K����5�?�|#8�m���l�gϞ#ک}{��鿶>���W�X�w}*0�C	��p���<6��@��~���c��4�`\rV����sO=�T�S���������Q����Z��r�q!p	!���mی��������z���/�llw�W�+)�_ړ�W��(Z��0a�q����.����5齒�,�	y�}�����%=a�����������J��:V:H��u��2�`�O<�8aJ�p�	��*R7�	��_��W�I��s�U��vZԡk���ܾ�[��h͡�\\\ZN X!���l;�-R�֭3j֬Y�}�/Vmmm�m��}CC��N��?�и=s�L��g���|�Au�y��P��L��ӟ��>������nll4���/�`�w�M7�Wr�x��Ǎ����}<��=�y\'�t����k#no���V5u�T��F��+�[o���ɓ\'�����~�\'N_y=]\'f3X�=��=�����p��f�����5�\\c�hC�`5w�\\�D*?[:�9�4�@�B���	A�vs�qǩ�/���^�����=5t�Ps��#����ˍ	�fﲄ�1c��+iG2!^�YI;��7Iz��y��ٳ��~Ç7z�{zz���{�=c������7�?����1	k?��όv.��;w�����H�	V�[�3u��+V,ԍ�9_O�ц#uÛ���_4�#͖���h��z�����ϖ�Θ1�(�H�K�	+�;X�Z2$.a��^>�g���_��~	Q���a�޽{��Y��$(����G��>�쳘�O��	V�;�_~�g�ԩ3�k������|�\0�*|���\ro+s��\Z�\Zz�+~��t�����$���p�\nN	V��?&�ؗ��`0��(+�I�&mX�tiZS���ުh��9XE�(X\r4�`\rV�׳,+=I�s�\Z5j��M.\r\'���`�e��\'����E�B>�9O\'N쑡�tذaË�5v�|�᜘�붏u�!R��B���\\N X����\"X!��I�&�n�Tڱc�*�߿5��\091��:h��\n����dbyyyw�z���JB���ɉ�\"X��K��wt\Z����_$1�����^ ���81S+�~)��̹�����&Mڽnݺ�x֩z��W�`�V&��ڜ*N�+�~)��L�\Z#���,8gΜV�Z����}�y�f���\\�����媪�e%%%����*�>�ǉ�`�/E�RF��|�)�@~VW���k����r�?�LM���Ή�`�/E����3@�%X��L�@����\0N̜	V��R+\0��	V���nV\081S+�~	V�w�3E��\"X��L��\"X��̉���\0pb�VH���zڍs�n�	V\0��\"�\n.��Դ+�vP�����`�8)��R\r\r\r�466~�gϞ�O�z�$T���m�5�`�9��=�\0�7�b}ܬ�cG�9����o�\"X9��w%\0p/���ra(���7o�\0�\08���,X��~�z��W�r(\0�\n\0R���p�>1m��%{\0�\n\0�����ȉI������\0+\0H,T���z��`�����`\0���*��24Ȟ@��8�����	�-XI]��@���NF�aB��z��w\0�\0 �QY�Pe	W粗\0�\0 \n��s�>�E	V��\0�\0 ��cǎ�\'���V�j��������A�^\0@�r���o�91=��z=�ެa2�]�>�=�`�E�T�+\0���\'�=�`�8rn��U�Z��:����~��|�\0��#C���Ǫ�p8��Ԫ���	\0+ǆ�h�p\n���V�Ğ\0@�r��(��|�9W1�c����2�X�Ǻ�CԒE���cK��i|h)QUU5XP��+{\0��1�*Zh��*\n��7ZW�������J�}����IO�>�>cO\0 Xe�Ȃ�z���>_��a:-�#L��f��s{��3��	{\0����8��u����z����Ϭ!���D͞=[544�m۶�}��)��~��ޮV�^�jjj�����᪛�+$����[�	\0+ׅ�T=?WBU�B���j�*�Xtuu���K��+hi���_%c��	\0���6Q=�?ǭ�j�5TUTT�S���M�>���B��G0cO\0 Xe-T�j//{�BW�������K�VWWۇ����Y��A�\0�UF�\'��U\Z�\Z���nB�Uu֞�dC�5\\�z��iq��������\0�U�CU�%=Z���\0�#\\Ez^ބ+YR�:�*�῁��s�D,�j�>XndO\0 Xe%T��P8Rq�+k�2k���s%s���#��aѢE�Z!���C2Ȟ\0@�J�Ha\'\\H\Z(\\����0ۻrΕ��9E��ު��0�v�R�9a]z�:;;���ӂ�����0�I�Y��Ξ\0@����DׅI���8�R�pk����\"����W�ܚLW����pۅ.Sc��y��t�u�,�j\Z-�u��{\0�*��͵��o����X�M�po���~G�Kz���ʶP�\\��.��ϵw��466�5X�\"���g)-�$ޖEB�\0V�+K-�҃�p\\�p58�Per՜�H����z��BT6�O��u;Y���{l��a���U.kÞ\0@�J�\r?�a�s���I��d�+k���c~��%Zz�ڃF�CD2�-bfO\0 X��\r?4D�lQ�p�L��������G�\Zu������c\n����������p���_eDC�=���������鯣�}���������?�5���O�5C�w���JW��~���F߾_�MԵ@߷P�_]��К~\\.�\\��I�1�����3��z�<�UUU58ɫSEQJ�fk�<M�S�1t2jB�㗺���\\W��������>Ե^�%\n:x�%\0�zI�~N�_u=�C�c��t�(	R�f��+uݬ�.�K��0	b�J�}c����5�B�m��P���_7�ǯ���O���鱂\rb\0@�=Vk% 	m���j걊gш=V����+�+r1䲲�c-�0�\n\0�V�@e1��c�H�r��6�\'�t�\Z\Zf>\0@��7�r*U�0kQ�%�}*0�p�O���O��\r�X\0��`5PU�p-�D[�*��M�,p�:V\"\\������?fb��@ �+�\0��z�b]�3�peG��ŝʵ\0�_�z��]Q=�pe���\\ݡ2k��J�$v�y~��+�zec\0\0�Cz���r��S.\\M����.��xV�����\"eK/�S�N=d�s\0\0d(\\Y\'�[CR<�Fz��.��d�\Zf]����2�p%�����:�����\r��\0���Â�&Ŀ���yɮ��J^�w�9���JtXP�g�b\0\0��d�f�:\0�YÕ̹�	��X?�\'խs�B����P\0 �k�L\'鹒Uڭ�H��s%��Jo�9L(�}���,�9�|UZZzض��\\2��C\0\0wIv�./��\"�9W�e�f�T\0��po�S^MT�3`�	���*���\0\0�_��y��@Vh�kJ�ڂm����!�.����԰�:\0\0���259��:\0\0@��BS�\0�w�\0\0\0b���?\0\0��+B\0\0@\n�U\r�\n\0\0 y2�J��\0\0@Je\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���\0ˣ�A��E<\0\0\0\0IEND�B`�',1),('2502',1,'X:\\source\\LIFT\\51-Demo\\newFlow\\com.yss.sofa.simpleflow\\target\\classes\\processes\\basic.bpmn20.xml','2501','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<!--\r\n* Copyright 2012-2014 the original author or authors.\r\n*\r\n* Licensed under the Apache License, Version 2.0 (the \"License\");\r\n* you may not use this file except in compliance with the License.\r\n* You may obtain a copy of the License at\r\n*\r\n*      http://www.apache.org/licenses/LICENSE-2.0\r\n*\r\n* Unless required by applicable law or agreed to in writing, software\r\n* distributed under the License is distributed on an \"AS IS\" BASIS,\r\n* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.\r\n* See the License for the specific language governing permissions and\r\n* limitations under the License.\r\n-->\r\n<definitions id=\"processDefinitions\"\r\n             xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\"\r\n             xmlns:activiti=\"http://activiti.org/bpmn\"\r\n             targetNamespace=\"processDefinitions\">\r\n\r\n    <process id=\"waiter\">\r\n\r\n        <startEvent id=\"start\"/>\r\n\r\n        <sequenceFlow id=\"flow1\" sourceRef=\"start\" targetRef=\"service1\"/>\r\n\r\n        <scriptTask id=\"service1\" scriptFormat=\"groovy\">\r\n            <script>\r\n               println \'customerId=\' + customerId\r\n            </script>\r\n        </scriptTask>\r\n\r\n        <sequenceFlow id=\"flow2\" sourceRef=\"service1\" targetRef=\"end\"/>\r\n\r\n        <endEvent id=\"end\"/>\r\n\r\n    </process>\r\n\r\n</definitions>',0),('2503',1,'X:\\source\\LIFT\\51-Demo\\newFlow\\com.yss.sofa.simpleflow\\target\\classes\\processes\\basic2.bpmn','2501','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<!--\r\n* Copyright 2012-2014 the original author or authors.\r\n*\r\n* Licensed under the Apache License, Version 2.0 (the \"License\");\r\n* you may not use this file except in compliance with the License.\r\n* You may obtain a copy of the License at\r\n*\r\n*      http://www.apache.org/licenses/LICENSE-2.0\r\n*\r\n* Unless required by applicable law or agreed to in writing, software\r\n* distributed under the License is distributed on an \"AS IS\" BASIS,\r\n* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.\r\n* See the License for the specific language governing permissions and\r\n* limitations under the License.\r\n-->\r\n<definitions id=\"processDefinitions\"\r\n             xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\"\r\n             xmlns:activiti=\"http://activiti.org/bpmn\"\r\n             targetNamespace=\"processDefinitions\">\r\n\r\n    <process id=\"waiter2\">\r\n\r\n        <startEvent id=\"start\"/>\r\n\r\n        <sequenceFlow id=\"flow1\" sourceRef=\"start\" targetRef=\"service1\"/>\r\n\r\n        <scriptTask id=\"service1\" scriptFormat=\"groovy\">\r\n            <script>\r\n               println \'customerId=\' + customerId\r\n            </script>\r\n        </scriptTask>\r\n\r\n        <sequenceFlow id=\"flow2\" sourceRef=\"service1\" targetRef=\"end\"/>\r\n\r\n        <endEvent id=\"end\"/>\r\n\r\n    </process>\r\n\r\n</definitions>',0),('27502',1,'X:\\source\\LIFT\\51-Demo\\newFlow\\com.yss.sofa.simpleflow\\target\\classes\\processes\\basic.bpmn20.xml','27501','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<!--\r\n* Copyright 2012-2014 the original author or authors.\r\n*\r\n* Licensed under the Apache License, Version 2.0 (the \"License\");\r\n* you may not use this file except in compliance with the License.\r\n* You may obtain a copy of the License at\r\n*\r\n*      http://www.apache.org/licenses/LICENSE-2.0\r\n*\r\n* Unless required by applicable law or agreed to in writing, software\r\n* distributed under the License is distributed on an \"AS IS\" BASIS,\r\n* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.\r\n* See the License for the specific language governing permissions and\r\n* limitations under the License.\r\n-->\r\n<definitions id=\"processDefinitions\"\r\n             xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\"\r\n             xmlns:activiti=\"http://activiti.org/bpmn\"\r\n             targetNamespace=\"processDefinitions\">\r\n\r\n    <process id=\"waiter\">\r\n\r\n        <startEvent id=\"start\"/>\r\n\r\n        <sequenceFlow id=\"flow1\" sourceRef=\"start\" targetRef=\"service1\"/>\r\n\r\n        <scriptTask id=\"service1\" scriptFormat=\"groovy\">\r\n            <script>\r\n               println \'customerId=\' + customerId\r\n            </script>\r\n        </scriptTask>\r\n\r\n        <sequenceFlow id=\"flow2\" sourceRef=\"service1\" targetRef=\"end\"/>\r\n\r\n        <endEvent id=\"end\"/>\r\n\r\n    </process>\r\n\r\n</definitions>',0),('27503',1,'X:\\source\\LIFT\\51-Demo\\newFlow\\com.yss.sofa.simpleflow\\target\\classes\\processes\\basic2.bpmn','27501','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<!--\r\n* Copyright 2012-2014 the original author or authors.\r\n*\r\n* Licensed under the Apache License, Version 2.0 (the \"License\");\r\n* you may not use this file except in compliance with the License.\r\n* You may obtain a copy of the License at\r\n*\r\n*      http://www.apache.org/licenses/LICENSE-2.0\r\n*\r\n* Unless required by applicable law or agreed to in writing, software\r\n* distributed under the License is distributed on an \"AS IS\" BASIS,\r\n* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.\r\n* See the License for the specific language governing permissions and\r\n* limitations under the License.\r\n-->\r\n<definitions id=\"processDefinitions\"\r\n             xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\"\r\n             xmlns:activiti=\"http://activiti.org/bpmn\"\r\n             targetNamespace=\"processDefinitions\">\r\n\r\n    <process id=\"waiter2\">\r\n\r\n        <startEvent id=\"start\"/>\r\n\r\n        <sequenceFlow id=\"flow1\" sourceRef=\"start\" targetRef=\"service1\"/>\r\n\r\n        <scriptTask id=\"service1\" scriptFormat=\"groovy\">\r\n            <script>\r\n               println \'customerId=\' + customerId\r\n            </script>\r\n        </scriptTask>\r\n\r\n        <sequenceFlow id=\"flow2\" sourceRef=\"service1\" targetRef=\"end\"/>\r\n\r\n        <endEvent id=\"end\"/>\r\n\r\n    </process>\r\n\r\n</definitions>',0),('3',1,'D:\\openSource\\Learn.demo\\activity\\target\\classes\\processes\\basic.bpmn20.xml','1','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<!--\r\n* Copyright 2012-2014 the original author or authors.\r\n*\r\n* Licensed under the Apache License, Version 2.0 (the \"License\");\r\n* you may not use this file except in compliance with the License.\r\n* You may obtain a copy of the License at\r\n*\r\n*      http://www.apache.org/licenses/LICENSE-2.0\r\n*\r\n* Unless required by applicable law or agreed to in writing, software\r\n* distributed under the License is distributed on an \"AS IS\" BASIS,\r\n* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.\r\n* See the License for the specific language governing permissions and\r\n* limitations under the License.\r\n-->\r\n<definitions id=\"processDefinitions\"\r\n             xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\"\r\n             xmlns:activiti=\"http://activiti.org/bpmn\"\r\n             targetNamespace=\"processDefinitions\">\r\n\r\n    <process id=\"waiter\">\r\n\r\n        <startEvent id=\"start\"/>\r\n\r\n        <sequenceFlow id=\"flow1\" sourceRef=\"start\" targetRef=\"service1\"/>\r\n\r\n        <scriptTask id=\"service1\" scriptFormat=\"groovy\">\r\n            <script>\r\n               println \'customerId=\' + customerId\r\n            </script>\r\n        </scriptTask>\r\n\r\n        <sequenceFlow id=\"flow2\" sourceRef=\"service1\" targetRef=\"end\"/>\r\n\r\n        <endEvent id=\"end\"/>\r\n\r\n    </process>\r\n\r\n</definitions>',0),('5002',1,'basic.bpmn20.xml','5001','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<!--\r\n* Copyright 2012-2014 the original author or authors.\r\n*\r\n* Licensed under the Apache License, Version 2.0 (the \"License\");\r\n* you may not use this file except in compliance with the License.\r\n* You may obtain a copy of the License at\r\n*\r\n*      http://www.apache.org/licenses/LICENSE-2.0\r\n*\r\n* Unless required by applicable law or agreed to in writing, software\r\n* distributed under the License is distributed on an \"AS IS\" BASIS,\r\n* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.\r\n* See the License for the specific language governing permissions and\r\n* limitations under the License.\r\n-->\r\n<definitions id=\"processDefinitions\"\r\n             xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\"\r\n             xmlns:activiti=\"http://activiti.org/bpmn\"\r\n             targetNamespace=\"processDefinitions\">\r\n\r\n    <process id=\"waiter\">\r\n\r\n        <startEvent id=\"start\"/>\r\n\r\n        <sequenceFlow id=\"flow1\" sourceRef=\"start\" targetRef=\"service1\"/>\r\n\r\n        <scriptTask id=\"service1\" scriptFormat=\"groovy\">\r\n            <script>\r\n               println \'customerId=\' + customerId\r\n            </script>\r\n        </scriptTask>\r\n\r\n        <sequenceFlow id=\"flow2\" sourceRef=\"service1\" targetRef=\"end\"/>\r\n\r\n        <endEvent id=\"end\"/>\r\n\r\n    </process>\r\n\r\n</definitions>',0),('7502',1,'test.bpmn20.xml','7501','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://activiti.org/bpmn20\" id=\"definitions\">\n  <process id=\"vacationRequest\" name=\"Vacation request\" isExecutable=\"true\">\n    <startEvent id=\"request\" activiti:initiator=\"employeeName\">\n      <extensionElements>\n        <activiti:formProperty id=\"numberOfDays\" name=\"Number of days\" type=\"long\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"startDate\" name=\"First day of holiday (dd-MM-yyy)\" type=\"date\" datePattern=\"dd-MM-yyyy hh:mm\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"vacationMotivation\" name=\"Motivation\" type=\"string\"></activiti:formProperty>\n      </extensionElements>\n    </startEvent>\n    <sequenceFlow id=\"flow1\" sourceRef=\"request\" targetRef=\"handleRequest\"></sequenceFlow>\n    <userTask id=\"handleRequest\" name=\"Handle vacation request\" activiti:candidateGroups=\"management\">\n      <documentation>${employeeName} would like to take ${numberOfDays} day(s) of vacation (Motivation: ${vacationMotivation}).</documentation>\n      <extensionElements>\n        <activiti:formProperty id=\"vacationApproved\" name=\"Do you approve this vacation\" type=\"enum\" required=\"true\">\n          <activiti:value id=\"true\" name=\"Approve\"></activiti:value>\n          <activiti:value id=\"false\" name=\"Reject\"></activiti:value>\n        </activiti:formProperty>\n        <activiti:formProperty id=\"managerMotivation\" name=\"Motivation\" type=\"string\"></activiti:formProperty>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"flow2\" sourceRef=\"handleRequest\" targetRef=\"requestApprovedDecision\"></sequenceFlow>\n    <exclusiveGateway id=\"requestApprovedDecision\" name=\"Request approved?\"></exclusiveGateway>\n    <sequenceFlow id=\"flow3\" sourceRef=\"requestApprovedDecision\" targetRef=\"sendApprovalMail\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${vacationApproved == \'true\'}]]></conditionExpression>\n    </sequenceFlow>\n    <manualTask id=\"sendApprovalMail\" name=\"Send confirmation e-mail\"></manualTask>\n    <sequenceFlow id=\"flow4\" sourceRef=\"sendApprovalMail\" targetRef=\"theEnd1\"></sequenceFlow>\n    <endEvent id=\"theEnd1\"></endEvent>\n    <sequenceFlow id=\"flow5\" sourceRef=\"requestApprovedDecision\" targetRef=\"adjustVacationRequestTask\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${vacationApproved == \'false\'}]]></conditionExpression>\n    </sequenceFlow>\n    <userTask id=\"adjustVacationRequestTask\" name=\"Adjust vacation request\" activiti:assignee=\"${employeeName}\">\n      <documentation>Your manager has disapproved your vacation request for ${numberOfDays} days.\n        Reason: ${managerMotivation}</documentation>\n      <extensionElements>\n        <activiti:formProperty id=\"numberOfDays\" name=\"Number of days\" type=\"long\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"startDate\" name=\"First day of holiday (dd-MM-yyy)\" type=\"date\" datePattern=\"dd-MM-yyyy hh:mm\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"vacationMotivation\" name=\"Motivation\" type=\"string\"></activiti:formProperty>\n        <activiti:formProperty id=\"resendRequest\" name=\"Resend vacation request to manager?\" type=\"enum\" required=\"true\">\n          <activiti:value id=\"true\" name=\"Yes\"></activiti:value>\n          <activiti:value id=\"false\" name=\"No\"></activiti:value>\n        </activiti:formProperty>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"flow6\" sourceRef=\"adjustVacationRequestTask\" targetRef=\"resendRequestDecision\"></sequenceFlow>\n    <exclusiveGateway id=\"resendRequestDecision\" name=\"Resend request?\"></exclusiveGateway>\n    <sequenceFlow id=\"flow7\" sourceRef=\"resendRequestDecision\" targetRef=\"handleRequest\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${resendRequest == \'true\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow8\" sourceRef=\"resendRequestDecision\" targetRef=\"theEnd2\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${resendRequest == \'false\'}]]></conditionExpression>\n    </sequenceFlow>\n    <endEvent id=\"theEnd2\"></endEvent>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_vacationRequest\">\n    <bpmndi:BPMNPlane bpmnElement=\"vacationRequest\" id=\"BPMNPlane_vacationRequest\">\n      <bpmndi:BPMNShape bpmnElement=\"request\" id=\"BPMNShape_request\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"0.0\" y=\"178.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"handleRequest\" id=\"BPMNShape_handleRequest\">\n        <omgdc:Bounds height=\"60.0\" width=\"100.0\" x=\"80.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"requestApprovedDecision\" id=\"BPMNShape_requestApprovedDecision\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"230.0\" y=\"114.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sendApprovalMail\" id=\"BPMNShape_sendApprovalMail\">\n        <omgdc:Bounds height=\"60.0\" width=\"100.0\" x=\"320.0\" y=\"0.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"theEnd1\" id=\"BPMNShape_theEnd1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"475.0\" y=\"15.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"adjustVacationRequestTask\" id=\"BPMNShape_adjustVacationRequestTask\">\n        <omgdc:Bounds height=\"60.0\" width=\"100.0\" x=\"320.0\" y=\"160.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"resendRequestDecision\" id=\"BPMNShape_resendRequestDecision\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"470.0\" y=\"233.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"theEnd2\" id=\"BPMNShape_theEnd2\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"560.0\" y=\"238.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\">\n        <omgdi:waypoint x=\"35.0\" y=\"195.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"80.0\" y=\"193.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"180.0\" y=\"193.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"192.0\" y=\"180.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"192.0\" y=\"134.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"230.0\" y=\"134.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"270.0\" y=\"134.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"282.0\" y=\"134.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"282.0\" y=\"30.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"320.0\" y=\"30.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\">\n        <omgdi:waypoint x=\"420.0\" y=\"30.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"432.0\" y=\"30.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"432.0\" y=\"30.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"475.0\" y=\"32.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\">\n        <omgdi:waypoint x=\"270.0\" y=\"134.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"282.0\" y=\"134.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"282.0\" y=\"190.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"320.0\" y=\"190.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\">\n        <omgdi:waypoint x=\"420.0\" y=\"190.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"432.0\" y=\"190.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"432.0\" y=\"253.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"470.0\" y=\"253.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow7\" id=\"BPMNEdge_flow7\">\n        <omgdi:waypoint x=\"470.0\" y=\"253.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"458.0\" y=\"253.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"239.0\" y=\"253.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"127.0\" y=\"253.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"130.0\" y=\"223.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow8\" id=\"BPMNEdge_flow8\">\n        <omgdi:waypoint x=\"510.0\" y=\"253.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"560.0\" y=\"255.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('7503',1,'test.vacationRequest.png','7501','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0]\0\0\0\0\0�k1�\0\0#IDATx���p�}�q�G	�4�%�����fhJ�h�2j��5�$�.�ʏ��Va�\"l\Zk�QM�[�1�h0��\".2 ���V��cp� ���,[B(�(�e���sW]��ku_��~?3��O=�ڳ��sΞ-+�e���ȑ#\r����_�޴��Py���V�e˖7�&�G\0P�4p������ns��Y�@���c6o����I�\0\0!��\"p�&x�mii��^	\0@�!E�JB�9�J\0\0���)\"��*t�J\0\0J<t�0=�v�_�?j����I�.\0\0����w�9��G���ϟ���`�Ä$B\0\0�4t��t������ņ�#A˪��̑O���:EH\"t\0�LB�@�ٿ�;��V���K_sׁMKLϱ�\'B\0\0H7t��/qW�b��\0\0x]��#;V��;���ڵڜ8�b�N$<�\0\0@�BW��ײ��D�\0\0�\n]��.7��?>�^����}}��\0\0�	]{��?�^������c�\'B\0\0H\'t��)�/6��yg0j����7O������+C�Нb��F�)�.�m�������l5\0@�BW�q��*�ХKE�v���D�ʊ���[$H=+!j��R�9\raR����h�\0�@�.��νf_�4��7}\'��]���I��V�گ�_�n\0@ BE��	H�c=U#�����,^��444�}�����.388h��А���6�2������L�/|����AZ9\0��E�t誨��<6_k$(E�Q�z�j+Ty100`�����ٳG�P(�\'��t\0\0��*��\\m΀TWWg�hebxx�477[=e��}Zj�\0@�J.t�{�tQS�tvv���Zg�\Z�Bi�\0\0BU2�+6�k$����\\�9`:����%?{<�\0@袊>t��R<����%�t___?j}/]��\0 t��:t�B��9�pesH1���~3c����e�|\0\0���U��K>u����y/v���X-�\0��p�E�3�.B�_H�Yk]\"ߖ.]�^K8J\0\0��������P(t#��Е+��/Ǉ�+�K��r^��ʆÇ�Z�+\Z���H\0�Z�r�����E��¾�1v��I�ٝ���g�s�Tiwp�\0\0�\"t��|9���Е�}�U�>�*�|)����ɬY��	�\0���.gϗ����}�k�:�kq���0��,t�`� )\0�4CPA���\Z���m��R���#�S	�/��%X�P��<�����ߺ�����OI@���J����xܷ{�^�������m��|>�Zt;~���5�82@��.���:�F�#������5eʔ�$@]%�?��s	R7E\"�[�/KM���]r{��.��W�G�����D�� ��K�B�ԛRg��b���^ۮ�}�3r�������{��u��B��R��G&\0 t�\"t�\n[� ���۷��o��\\r�%��K/57�t�ٺu+s�r����b	nW�~s��7��a�+��c�E��e�^�yi����ǅF�\0BW�B�6=K�������:݆f�޽f�����k����U@UUUL�NkOXEE��?��\0(���g+ȡK{�4h�Dl�}�__�\n[]���r��Ŝ.\0@ц�t)t=��CV���LMM���E�*,	X��g��$	[�N��s�\"\0���P�s���}\Z�4�i#t��+���}���N��lGO�r�L\0@�\"t����+t�zB������~X������&qd\0B�+N�?�\nZz�Ν;��:�^_��Z���\n\'6�~�ڋ������5�׃��\0�.BW�ڳg�Ȓ^x��dĶm�]�i#�\Z��V�\\�]�8*\0�����E�9Ĩ\'B�s���N������H��J\0@�\"t��R�r@/�����)o�k��]?�	\0]�.BWQ/����Ҟ��^{-火��y�Ÿu��H\0@�\"t�L	���v��{���@��.1�V����\0]�.�$BWEE���z� T__o]�\'�K�tc�<\0�]TI�.��J�فH�\\���fuH��õN����\0��E�J*t)���v���J�ez2=Kq����o�\0��E�J7t����[�m�v�$]����u�S]��ջe\r)�\0��E�J>t�z��K��p�%s��w�g�yƴ��Yg9���VC�����̙�Z�Y�L�\0B��\"t�ho�����^�����Ų\0@�\"tQ��$b�h\\�d�f�ܰU�4\0 tQ�.���c��D�8Ï]�p�En�K@���W\0]�\0\0B���\0\0���E�\0\0�.��\0\0���E�\0���\'�ׯ\'���%t���\0\0P��k˖-]���Tgg�J��Ok\0�C׆\rnߴiӯN�:�k�O�z�4p�����Dk\0�C����\'����С-�SD�t��\'p\0P�\0\0��\0\0\0B\0\0\0�\0\0��\0\0\0B\0\0\0�\0\0\0�.\0\0\0B\0\0\0�\0\0\0�.\0\0\0B\0\0\0]\0\0\0�.\0\0\0B\0\0\0]\0\0\0�.\0\0\0B\0\0\0]\0\0\0�.\0\0\0�\0\0\0]\0\0\0�.\0\0\0�\0\0\0]\0\0\0�.B\0\0\0�\0\0��\0\0\0B\0\0\0�\0\0��\0\0\0B\0\0\0�\0\0\0�.\0\0\0B\0\0\0�\0\0\0�.\0\0\0B\0\0\0�\0\0\0�.\0\0\0B\0\0\0]\0\0\0�.\0\0\0B\0\0\0]\0\0\0�.\0\0\0�\0\0\0]\0\0\0�.\0\0\0�\0\0\0]\0\0\0�.\0\0�\"7��\0\0�[�L��\0\0��H�I-��N$t\0\0�&p�AK{�z\n�]\0\0�TW��	]\0\0\0MH����6ǋ�\0\0�5p�\nTy��\"t\0�brK��,��\'t\0\0W��z���N�:x�\0\0@)�l}=�\0\0�T����}]\0\0�hW��s��E�\0\0A��.�i�[/�_�����.\0\0��5��~P���+��C�J�uY^�.\0\0����ł�����ˮ��׳:ǋ�\0\0�$Q����x���8���/B\0\0ȫp8�\"���A*^�J7p��WFC��.\0\0�W\Z>�4|�B����t�O���5p9~OY=^�.\0\0P���u)z���%\n^�1p�2��E�\0\0�]#=_q��X�T�^3\\��>�.\0\0�������\r;fz�`���I�r�	^����\0 �����/��hY��<Rt�p�=��ec�w��\0P��\'!oG(�X^^~Q쭙^�\'YO��T���\0\0�]��8��r3�k,��9]\0\0 p�k[8�#A؊t��YJ�,D���/�^\0\0�\n]�z�R�T�\'�:\\^W��}��u�\0\0@�BWR�4�����eq�Q\"�\0\0�x�P��^L�,D����yw��v\0\0%���x�����y_�+^���9Y��5�\0\05���p(/�&���\\��\0\0�!��\Z50M-����2]��\0\0�.�yݬ�\r]��\0\0a ��+���\0\0�.d:$��!EB\0\0(�00ֳ\r�>i��\0\0�=x\"��\"�\0\0sH7H�}2^i��\0\0J9L��	I^��W�\"t\0�b�z��6�H�\0\0��� ���\0\0J!�AkY��\0\0�J�9\\�,��B��\0\0a��l�\0\0��\0\0�0\0�3\0\0 ��\0\0a\0lg\0\0@(��l���ȑ#\r����_�޴��Py���V�e˖7�&�R\0�0�\"��\Z����Lww�9{�,U����1�7o~K�$Z\0P��Y{�\\�	^g[ZZ��Z\0$��D��\']����x�SҞ��Z\0$��D��\']��4��~|�h�\0cx\"���.BW:��ۿ�2Gv�2�ZZ���9��@1<��	B�+�>u��Ӽ�b����J���hw�.\0>��L��M�\"t�ڧ:����e������]\0��� t���~�o�N�Х���]\0|t�fx��E�\nn�z�eA�Х���]\0|t�fx��E�\"tQ�.\0y8h3<A�\"t7t�t�D�W_���\0�I��6��Е�����G�_}�vG�@��M�\"te���v�5��4���+��k�;B\0�� t���8�ѝO��v�9�����O�]]gΘW�g��mW���hw�.\0>:h3<A�\"t3t�.��.O��I_c�B\0?}Rfx��E�\nV�:s�t������?%\\v�{���z���Z�`��+V<�hѢ�uuu=555CUUUF�Z������w_��|������y�������A\n]�z���\"t9U__����6y���H�2MMMf�޽����[oo�9p��y��ҥK��_BX�|Muyy�E��� t!X�+�ޭd�^�CB0&�gϾ�����3}���444X�ʋ��!�u�V3o޼���Ԝ�1c�ߗL�bx��n��w+++o	��H�������ߡ���\ZkಋvH�<�������}���C300`2�c�#�kh�̙M��������A;N�:-�&�H�od_���N�]@�̝;��w�u��]�L6����+VE������\Z��(\\�[���]�.B��5k֬wt�V�<����L�<�-����1t1<Q���iӦB���E�|O���+�����sϝ����/���_|��6���K��M\'���={��|yꩧND\"����F�����[�>C����4w�ܗu�|�}�[�:\n�f�(ڄ�l�<-\r_r|���K�|C���e!�q��W���ÑH�M98^I�8h����.^����.|���h\n���\'�ń.��6�+G�k����h��_ ���>�r�ׅO����-�7�2�K\'��z^:�q�栍��.gϗ;�~i�@^�\\�r�^ڧо�oLg�k����Y�}Rs�\r}r�栍������_5��!����^�vm�C��?��/C����j؃RK$�]O�\"t!�!o���v�:�k�yUWWף�.����=Ҁ6���-��g��M�B Bר��i����>���UG�M�>�=��c�͛7��~��i[��ل.�����|,���ɓ\'��uh8�9!�.�?tm�Jw$�/:���s�Α\0����}/�Е�������&t��UUU���a�ڀ���/�2e�e�H�\n9X^%����G��x��gr�r��*++?��ؓ�+��v�\n�*�����ֵ����s��b��yP�_�����*�����Hn����Z���4B�;RÄ.B|���le#t}�ߴ�G4\Z�n�84�ځ�\r7�`.��R�կ~5aO�;�8?��s���7_|��}�w�����K.�����O?m=7y�d��ԩS�ǫW��z�>�яZ�磌�2O<���cǎ�>���Ǐ7۶m��r�?��&twZ����!���ޔ:%�!uXj�D���N���`[��y\rL\Z��Vǂ�����_bAk���`� u�3��T$�4�}A���$a�|ߚ����j@�z�Nv�����B~*.��^xm�����}�{�y��߯��V��`����\Zb��g�}�\nOc	]�}�{G�-�o�n��ԧ>��M�8q�z�C������������\nP�}��>��_��/|�z�aKou�T�O�~z��\"���Q�q�-=�Q��t�t��Lڥ���I�./�׏�ck��3g���������>v���0�����n�ɺ�=M\Z�V�XazzzR����6n�h�jx��5�����������>��O���/s��r�gs��:�\\\\ ak\\6��������{���.�>i?�裞�3���Cz���~��_6���z�\rQ����u�m��ڇ�CX6B�~��^:�y�5�X�_w�u)��˭�n��v���_�����K}�g������d�����7���痳�|�t8sY���5t�+�n}�x�W��W\\q���{���ݻ�^�\\��z�E7DA�B�B�\'^x��_���s�?���?�}�m�n�\r\r\r	ۣ~p��ڞ���Q�}�ӟiSv���>`�����[o�52�i����ޮY�fT�Ҷ��9v�ݺu먶���n�$t�NWss�/��ҵ���]�l岧+�n}��/��ݽLZ�\\�\rQ���е|�rk��Ť���}Z{}u»�\r>ӧO?o߷ۭ����u�={������`�����6�=�v��\\�}����i���cI��SwO��Q\rx�3��뇤d�w�lB0������<t͚5�i@��><�,t�ۭ/���ܟ��m��Ѕ\\�߱�������|�2&t�����^=mڴ��A��kt��vOR/�Е�[?�פ;��D��:���7�|�y�_Ї(]�c����>g�����\'�Ѕ6gΜ_nڴ�`��G�\n�+��v�\0��[?�פ\Zΰ��|�ץC�34��0�����~]�1w������N!��8�D��EP9hS/��K�%t����Ԝlkk�{�Z�h�.x���6E���K�BI������3������v���j8�eEE���)Bh��_BJ�̙3���>��a�\'N谢^v��6E��\"t����a��}��\'�r��������p8<��6E��\"t�$�\n�S�L�mll<���X�Z�A�\"t��K�P��L�ɓ\'w>���\'�=�K������6��_��d��K�O���cǎ��tY=KQ\'�}mBh��ȉP(4K�שx��Ç������+vh�4��A>K��6��.��䜆%ٹHuTWW|衇�mܸq���Ǐ9CVoo����=z�j���^�GW��§�	] tQ�.��=_7��:��R�tǏU��6�%z�� ^K��6��.����6E���K�8hS�.�~)B\0���/�\0m�Ѕ�[�~=��?5(���\0��Ѕ\"�e˖���nڎ����?���\'t t�P�6l�p��M�~u�ԩ_�~\n�å�������$B����� ��O��f��;\Zک��n��^�(AO{x@p��S�gΜ)��	\0�.\0��U�V�H$b^z饒�\0@���+//�HZ����\Z\0]\0�#�px�}��b�(9\0B\02p]\n��+_�V@�����;�V�7�e\0�\0 K\"��\rr�\Zt�.��l\0�.\0�ށ�-N�2�P�gl\0�.\0��A*\Z/p9���l%\0�.\0�@EE��r�:�\"t=Ɩ@��TVV�\"��R��k\0��︂�9��\0@��q����8h5�B��X/ص:�^�_͖@��	R&v ��V�cK\0 t�������n\'�W�}���D>��\0@��eಃ��t���`��H��[\0�˷�+��\0�@/$��\n�\0B�/LH��י��A��w��ܹ$v2Y��$�.�mz��w��qf�!�,Xp��X�z��\0@��M�J���J��Y� �l���$�s\Z�tmK.����.١�dK\0 t�-e�z�������OJ����~��b�\"���ٙ�%\0�|�&���N�F���8�S5������ŋMCC�ٷo����2���F\r\r\r���ns��!���h�oʔ)���:ֱD&����dK\0 t.pe��Fl�ɍΠ�F��ի�P�����ijj2�g�v_��On�i}�LǺ�A[\0�� RM����	z�js���:�G+��æ����)s|��R�h��DW����#�\0BW�W��K����åÈ\Z���������:�נ�ʉ�VK}�-�ЕW�I�����u%9�>6�k$����\\�9`:����%?{<-i��>Wv��\0]y\\��e����<�D_WR�+v��9gW.�����Q�{�\Z`�F���#;��\0BWA��N�C�r.��:^/�9^���Ϝs��9��H��1c�sr�2Z#�9`=�C�l	\0���K���d�+���=���~����<K1�I�^�ڵ�=��ZZ$R�\Zt2=[\0�+5=�[�3�	�T���n�r�	E��_k]\"ߖ.]�^Kh�H�ö�\'�\0BWz?OK×|`�1�/K7��\n^^�������+\Z��K#\0_i_�G�s�W6>|x��]���(��.] �-�Е~�r�P�����_��u��-Ps���;�s�,��.^m���Bq.�*���J$۱�襀�\0]c\n]#=_q��X�T�^3\\��>���u��>O>��%�:c1�5k�0���Z/z͖\0@�\Z{�r�|ņ3�Y��2	\\��5��מ8�މ���_�x��b�(X��5���V��,XpA���NQE�J���z\\���`��L,�}�q>]���~	6b�鰟��Y�nǏ�f��>M\02;��0���L/񓬧�����t�~�a�_K�%�����R�%��ۗ�vK���Oc�J/I���;����������Ǐ��w��M�/���P�N����(��)��!��KM�Ǒ�e���\'�?_YY��:D+�?�F���|�+��.��\n�\0\0 ���F��e���5��52�Kߊ��K���~o�ԩ ����5:�W��������!��R��\"\rF\Z�4(i`��J��*\rV\Z�bW:���L��2\rf����6\rn\Z�4�I�(�7�.XݞF�\Zv>.4B\0\0�]�4|$[�N�=^����w���������r�{��\0��BW����=Lc\\���J\'x}�,@�t陊��5�gj��o��.\0\0p�T=M�.|�5x�C��Y?J/�c_ZG�V��Is�\"\0\0(K�ҽ�b�e!�\r^��Ԃ���eR��.�Y�u��g;z����\0�����V�}�x�k����Ů���d?�H_[[�]���\0�W�rN�w(/�&����ȵ�����k/���z>�`��P\0\0P8�F\rLS˼/���L�缮��Ƽ���+W:C�*vk\0\0��2o貨9�kjj�tDgg���f��H$r�4\0\0��s1�lҥ;b��[����)o�k��kC>ˮ\0��e:$XRC�n��.�yz��r�����Ê��k�\0\0�/�=U%1i>	>k�t�=��������[��\ZV����\0@�x\",�!�xbk{��A���޺<O.W4\Ze�<\0\0%���>�Zi>�B�ЍR}v �9W���YRt�p��K��\0�	�@5!��=���E����WJ/ӓ�Y����w_x��\0@�H��Őb\n�����u�!IW��z}F]�T��r�nYC�.\0\0�;x����K8�p�%s��w�g�yƴ��Yg9���VC�����̙�Z�Y�L�\0����2�7�%�k���k,��p�,\0\0�O�p��_b�b�h\\�d�f�ܰU�4\0@i�&�L4\Z}wl���g��+���r	hwr�j\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 �R��۟<�*\0\0\0\0IEND�B`�',1);

/*Table structure for table `act_ge_property` */

DROP TABLE IF EXISTS `act_ge_property`;

CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_property` */

insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('next.dbid','57501',24),('schema.history','create(5.21.0.0)',1),('schema.version','5.21.0.0',1);

/*Table structure for table `act_hi_actinst` */

DROP TABLE IF EXISTS `act_hi_actinst`;

CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_actinst` */

insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('12506','vacationRequest:1:7504','7505','7505','requestApprovedDecision',NULL,NULL,'Request approved?','exclusiveGateway',NULL,'2019-06-03 02:50:59.037','2019-06-03 02:50:59.040',3,'test1'),('12507','vacationRequest:1:7504','7505','7505','sendApprovalMail',NULL,NULL,'Send confirmation e-mail','manualTask',NULL,'2019-06-03 02:50:59.040','2019-06-03 02:50:59.040',0,'test1'),('12508','vacationRequest:1:7504','7505','7505','theEnd1',NULL,NULL,NULL,'endEvent',NULL,'2019-06-03 02:50:59.040','2019-06-03 02:50:59.040',0,'test1'),('12511','vacationRequest:1:7504','12509','12509','request',NULL,NULL,NULL,'startEvent',NULL,'2019-06-03 03:03:25.070','2019-06-03 03:03:25.073',3,'test1'),('12514','vacationRequest:1:7504','12509','12509','handleRequest','12515',NULL,'Handle vacation request','userTask',NULL,'2019-06-03 03:03:25.073','2019-06-03 03:07:23.936',238863,'test1'),('12520','vacationRequest:1:7504','12509','12509','requestApprovedDecision',NULL,NULL,'Request approved?','exclusiveGateway',NULL,'2019-06-03 03:07:23.936','2019-06-03 03:07:23.937',1,'test1'),('12521','vacationRequest:1:7504','12509','12509','sendApprovalMail',NULL,NULL,'Send confirmation e-mail','manualTask',NULL,'2019-06-03 03:07:23.937','2019-06-03 03:07:23.937',0,'test1'),('12522','vacationRequest:1:7504','12509','12509','theEnd1',NULL,NULL,NULL,'endEvent',NULL,'2019-06-03 03:07:23.937','2019-06-03 03:07:23.937',0,'test1'),('12525','vacationRequest:1:7504','12523','12523','request',NULL,NULL,NULL,'startEvent',NULL,'2019-06-03 03:08:38.690','2019-06-03 03:08:38.692',2,'test1'),('12528','vacationRequest:1:7504','12523','12523','handleRequest','12529',NULL,'Handle vacation request','userTask',NULL,'2019-06-03 03:08:38.692','2019-06-03 03:09:16.008',37316,'test1'),('12534','vacationRequest:1:7504','12523','12523','requestApprovedDecision',NULL,NULL,'Request approved?','exclusiveGateway',NULL,'2019-06-03 03:09:16.008','2019-06-03 03:09:16.008',0,'test1'),('12535','vacationRequest:1:7504','12523','12523','sendApprovalMail',NULL,NULL,'Send confirmation e-mail','manualTask',NULL,'2019-06-03 03:09:16.008','2019-06-03 03:09:16.008',0,'test1'),('12536','vacationRequest:1:7504','12523','12523','theEnd1',NULL,NULL,NULL,'endEvent',NULL,'2019-06-03 03:09:16.009','2019-06-03 03:09:16.009',0,'test1'),('12539','vacationRequest:1:7504','12537','12537','request',NULL,NULL,NULL,'startEvent',NULL,'2019-06-03 03:11:32.362','2019-06-03 03:11:32.362',0,'test1'),('12542','vacationRequest:1:7504','12537','12537','handleRequest','12543',NULL,'Handle vacation request','userTask',NULL,'2019-06-03 03:11:32.362','2019-06-03 03:13:22.706',110344,'test1'),('12552','vacationRequest:1:7504','12537','12537','requestApprovedDecision',NULL,NULL,'Request approved?','exclusiveGateway',NULL,'2019-06-03 03:13:22.706','2019-06-03 03:13:22.706',0,'test1'),('12553','vacationRequest:1:7504','12537','12537','adjustVacationRequestTask','12554',NULL,'Adjust vacation request','userTask',NULL,'2019-06-03 03:13:22.706','2019-06-03 03:26:29.548',786842,'test1'),('12559','vacationRequest:1:7504','12537','12537','resendRequestDecision',NULL,NULL,'Resend request?','exclusiveGateway',NULL,'2019-06-03 03:26:29.548','2019-06-03 03:26:29.548',0,'test1'),('12560','vacationRequest:1:7504','12537','12537','handleRequest','12561',NULL,'Handle vacation request','userTask',NULL,'2019-06-03 03:26:29.548','2019-06-03 03:34:14.554',465006,'test1'),('12563','vacationRequest:1:7504','12537','12537','requestApprovedDecision',NULL,NULL,'Request approved?','exclusiveGateway',NULL,'2019-06-03 03:34:14.554','2019-06-03 03:34:14.554',0,'test1'),('12564','vacationRequest:1:7504','12537','12537','adjustVacationRequestTask','12565',NULL,'Adjust vacation request','userTask',NULL,'2019-06-03 03:34:14.554','2019-06-03 04:11:24.563',2230009,'test1'),('15001','vacationRequest:1:7504','12537','12537','resendRequestDecision',NULL,NULL,'Resend request?','exclusiveGateway',NULL,'2019-06-03 04:11:24.601','2019-06-03 04:11:24.607',6,'test1'),('15002','vacationRequest:1:7504','12537','12537','handleRequest','15003',NULL,'Handle vacation request','userTask',NULL,'2019-06-03 04:11:24.607','2019-06-03 04:29:09.630',1065023,'test1'),('17507','vacationRequest:1:7504','12537','12537','requestApprovedDecision',NULL,NULL,'Request approved?','exclusiveGateway',NULL,'2019-06-03 04:29:09.630','2019-06-03 04:29:09.638',8,'test1'),('17508','vacationRequest:1:7504','12537','12537','adjustVacationRequestTask','17509',NULL,'Adjust vacation request','userTask',NULL,'2019-06-03 04:29:09.638','2019-06-03 04:31:05.983',116345,'test1'),('17510','vacationRequest:1:7504','12537','12537','resendRequestDecision',NULL,NULL,'Resend request?','exclusiveGateway',NULL,'2019-06-03 04:31:05.983','2019-06-03 04:31:05.983',0,'test1'),('17511','vacationRequest:1:7504','12537','12537','handleRequest','17512',NULL,'Handle vacation request','userTask',NULL,'2019-06-03 04:31:05.984','2019-06-03 05:34:08.675',3782691,'test1'),('17523','vacationRequest:1:7504','17521','17521','request',NULL,NULL,NULL,'startEvent',NULL,'2019-06-03 04:34:31.213','2019-06-03 04:34:31.214',1,'test1'),('17526','vacationRequest:1:7504','17521','17521','handleRequest','17527',NULL,'Handle vacation request','userTask',NULL,'2019-06-03 04:34:31.214','2019-06-03 04:40:24.042',352828,'test1'),('17563','vacationRequest:1:7504','17521','17521','requestApprovedDecision',NULL,NULL,'Request approved?','exclusiveGateway',NULL,'2019-06-03 04:40:24.042','2019-06-03 04:40:24.042',0,'test1'),('17564','vacationRequest:1:7504','17521','17521','sendApprovalMail',NULL,NULL,'Send confirmation e-mail','manualTask',NULL,'2019-06-03 04:40:24.042','2019-06-03 04:40:24.042',0,'test1'),('17565','vacationRequest:1:7504','17521','17521','theEnd1',NULL,NULL,NULL,'endEvent',NULL,'2019-06-03 04:40:24.042','2019-06-03 04:40:24.042',0,'test1'),('17568','vacationRequest:1:7504','17566','17566','request',NULL,NULL,NULL,'startEvent',NULL,'2019-06-03 04:54:59.687','2019-06-03 04:54:59.688',1,'test1'),('17571','vacationRequest:1:7504','17566','17566','handleRequest','17572',NULL,'Handle vacation request','userTask',NULL,'2019-06-03 04:54:59.689','2019-06-03 04:57:32.813',153124,'test1'),('17579','vacationRequest:1:7504','17566','17566','requestApprovedDecision',NULL,NULL,'Request approved?','exclusiveGateway',NULL,'2019-06-03 04:57:32.813','2019-06-03 04:57:32.814',1,'test1'),('17580','vacationRequest:1:7504','17566','17566','adjustVacationRequestTask','17581',NULL,'Adjust vacation request','userTask',NULL,'2019-06-03 04:57:32.814','2019-06-03 05:38:11.236',2438422,'test1'),('17584','vacationRequest:1:7504','17582','17582','request',NULL,NULL,NULL,'startEvent',NULL,'2019-06-03 04:59:26.810','2019-06-03 04:59:26.810',0,'test1'),('17587','vacationRequest:1:7504','17582','17582','handleRequest','17588',NULL,'Handle vacation request','userTask',NULL,'2019-06-03 04:59:26.810',NULL,NULL,'test1'),('17602','vacationRequest:1:7504','12537','12537','requestApprovedDecision',NULL,NULL,'Request approved?','exclusiveGateway',NULL,'2019-06-03 05:34:08.675','2019-06-03 05:34:08.676',1,'test1'),('17603','vacationRequest:1:7504','12537','12537','adjustVacationRequestTask','17604',NULL,'Adjust vacation request','userTask','lsp','2019-06-03 05:34:08.676','2019-06-06 01:32:42.970',244714294,'test1'),('17626','vacationRequest:1:7504','17566','17566','resendRequestDecision',NULL,NULL,'Resend request?','exclusiveGateway',NULL,'2019-06-03 05:38:11.236','2019-06-03 05:38:11.237',1,'test1'),('17627','vacationRequest:1:7504','17566','17566','handleRequest','17628',NULL,'Handle vacation request','userTask',NULL,'2019-06-03 05:38:11.237',NULL,NULL,'test1'),('22507','vacationRequest:1:22504','22505','22505','request',NULL,NULL,NULL,'startEvent',NULL,'2019-06-03 14:33:30.108','2019-06-03 14:33:30.123',15,'lsp_test'),('22509','vacationRequest:1:22504','22505','22505','handleRequest','22510',NULL,'Handle vacation request','userTask','shengpengliu','2019-06-03 14:33:30.123','2019-06-04 05:40:13.948',54403825,'lsp_test'),('30004','vacationRequest:1:22504','22505','22505','requestApprovedDecision',NULL,NULL,'Request approved?','exclusiveGateway',NULL,'2019-06-04 05:40:13.948','2019-06-04 05:40:13.955',7,'lsp_test'),('30005','vacationRequest:1:22504','22505','22505','adjustVacationRequestTask','30006',NULL,'Adjust vacation request','userTask','lsp','2019-06-04 05:40:13.955','2019-06-06 01:41:26.163',158472208,'lsp_test'),('32502','vacationRequest:1:7504','12537','12537','resendRequestDecision',NULL,NULL,'Resend request?','exclusiveGateway',NULL,'2019-06-06 01:32:42.970','2019-06-06 01:32:42.977',7,'test1'),('32503','vacationRequest:1:7504','12537','12537','handleRequest','32504',NULL,'Handle vacation request','userTask',NULL,'2019-06-06 01:32:42.977',NULL,NULL,'test1'),('35001','vacationRequest:1:22504','22505','22505','resendRequestDecision',NULL,NULL,'Resend request?','exclusiveGateway',NULL,'2019-06-06 01:41:26.197','2019-06-06 01:41:26.206',9,'lsp_test'),('35002','vacationRequest:1:22504','22505','22505','handleRequest','35003',NULL,'Handle vacation request','userTask',NULL,'2019-06-06 01:41:26.206','2019-06-06 01:44:45.800',199594,'lsp_test'),('37501','vacationRequest:1:22504','22505','22505','requestApprovedDecision',NULL,NULL,'Request approved?','exclusiveGateway',NULL,'2019-06-06 01:44:45.855','2019-06-06 01:44:45.862',7,'lsp_test'),('37502','vacationRequest:1:22504','22505','22505','adjustVacationRequestTask','37503',NULL,'Adjust vacation request','userTask','lsp','2019-06-06 01:44:45.862','2019-06-06 01:48:26.003',220141,'lsp_test'),('40001','vacationRequest:1:22504','22505','22505','resendRequestDecision',NULL,NULL,'Resend request?','exclusiveGateway',NULL,'2019-06-06 01:48:26.045','2019-06-06 01:48:26.052',7,'lsp_test'),('40002','vacationRequest:1:22504','22505','22505','handleRequest','40003',NULL,'Handle vacation request','userTask',NULL,'2019-06-06 01:48:26.052','2019-06-06 01:49:15.944',49892,'lsp_test'),('40006','vacationRequest:1:22504','22505','22505','requestApprovedDecision',NULL,NULL,'Request approved?','exclusiveGateway',NULL,'2019-06-06 01:49:15.944','2019-06-06 01:49:15.945',1,'lsp_test'),('40007','vacationRequest:1:22504','22505','22505','adjustVacationRequestTask','40008',NULL,'Adjust vacation request','userTask','lsp','2019-06-06 01:49:15.945','2019-06-06 01:49:35.530',19585,'lsp_test'),('40009','vacationRequest:1:22504','22505','22505','resendRequestDecision',NULL,NULL,'Resend request?','exclusiveGateway',NULL,'2019-06-06 01:49:35.530','2019-06-06 01:49:35.530',0,'lsp_test'),('40010','vacationRequest:1:22504','22505','22505','handleRequest','40011',NULL,'Handle vacation request','userTask',NULL,'2019-06-06 01:49:35.530','2019-06-06 01:55:17.985',342455,'lsp_test'),('40014','vacationRequest:1:22504','22505','22505','requestApprovedDecision',NULL,NULL,'Request approved?','exclusiveGateway',NULL,'2019-06-06 01:55:17.985','2019-06-06 01:55:17.986',1,'lsp_test'),('40015','vacationRequest:1:22504','22505','22505','adjustVacationRequestTask','40016',NULL,'Adjust vacation request','userTask','lsp','2019-06-06 01:55:17.986','2019-06-06 01:59:56.437',278451,'lsp_test'),('40017','vacationRequest:1:22504','22505','22505','resendRequestDecision',NULL,NULL,'Resend request?','exclusiveGateway',NULL,'2019-06-06 01:59:56.437','2019-06-06 01:59:56.437',0,'lsp_test'),('40018','vacationRequest:1:22504','22505','22505','handleRequest','40019',NULL,'Handle vacation request','userTask','shengpengliu','2019-06-06 01:59:56.438','2019-06-06 02:00:44.698',48260,'lsp_test'),('40022','vacationRequest:1:22504','22505','22505','requestApprovedDecision',NULL,NULL,'Request approved?','exclusiveGateway',NULL,'2019-06-06 02:00:44.698','2019-06-06 02:00:44.698',0,'lsp_test'),('40023','vacationRequest:1:22504','22505','22505','adjustVacationRequestTask','40024',NULL,'Adjust vacation request','userTask','lsp','2019-06-06 02:00:44.698','2019-06-06 02:02:26.226',101528,'lsp_test'),('40025','vacationRequest:1:22504','22505','22505','resendRequestDecision',NULL,NULL,'Resend request?','exclusiveGateway',NULL,'2019-06-06 02:02:26.226','2019-06-06 02:02:26.226',0,'lsp_test'),('40026','vacationRequest:1:22504','22505','22505','handleRequest','40027',NULL,'Handle vacation request','userTask','shengpengliu','2019-06-06 02:02:26.226','2019-06-06 02:02:58.789',32563,'lsp_test'),('40030','vacationRequest:1:22504','22505','22505','requestApprovedDecision',NULL,NULL,'Request approved?','exclusiveGateway',NULL,'2019-06-06 02:02:58.789','2019-06-06 02:02:58.789',0,'lsp_test'),('40031','vacationRequest:1:22504','22505','22505','adjustVacationRequestTask','40032',NULL,'Adjust vacation request','userTask','shengpengliu','2019-06-06 02:02:58.789','2019-06-06 06:12:39.015',14980226,'lsp_test'),('42501','vacationRequest:1:22504','22505','22505','resendRequestDecision',NULL,NULL,'Resend request?','exclusiveGateway',NULL,'2019-06-06 06:12:39.049','2019-06-06 06:12:39.056',7,'lsp_test'),('42502','vacationRequest:1:22504','22505','22505','handleRequest','42503',NULL,'Handle vacation request','userTask',NULL,'2019-06-06 06:12:39.056','2019-06-06 06:14:01.070',82014,'lsp_test'),('42506','vacationRequest:1:22504','22505','22505','requestApprovedDecision',NULL,NULL,'Request approved?','exclusiveGateway',NULL,'2019-06-06 06:14:01.071','2019-06-06 06:14:01.071',0,'lsp_test'),('42507','vacationRequest:1:22504','22505','22505','adjustVacationRequestTask','42508',NULL,'Adjust vacation request','userTask','shengpengliu','2019-06-06 06:14:01.071','2019-06-06 07:21:59.419',4078348,'lsp_test'),('45001','vacationRequest:1:22504','22505','22505','resendRequestDecision',NULL,NULL,'Resend request?','exclusiveGateway',NULL,'2019-06-06 07:21:59.465','2019-06-06 07:21:59.470',5,'lsp_test'),('45002','vacationRequest:1:22504','22505','22505','handleRequest','45003',NULL,'Handle vacation request','userTask','shengpengliu','2019-06-06 07:21:59.470','2019-06-06 07:23:32.332',92862,'lsp_test'),('45006','vacationRequest:1:22504','22505','22505','requestApprovedDecision',NULL,NULL,'Request approved?','exclusiveGateway',NULL,'2019-06-06 07:23:32.333','2019-06-06 07:23:32.333',0,'lsp_test'),('45007','vacationRequest:1:22504','22505','22505','adjustVacationRequestTask','45008',NULL,'Adjust vacation request','userTask','shengpengliu','2019-06-06 07:23:32.333','2019-06-06 07:25:38.638',126305,'lsp_test'),('47502','vacationRequest:1:22504','22505','22505','resendRequestDecision',NULL,NULL,'Resend request?','exclusiveGateway',NULL,'2019-06-06 07:25:38.638','2019-06-06 07:25:38.645',7,'lsp_test'),('47503','vacationRequest:1:22504','22505','22505','handleRequest','47504',NULL,'Handle vacation request','userTask','shengpengliu','2019-06-06 07:25:38.645','2019-06-06 07:36:09.383',630738,'lsp_test'),('50002','vacationRequest:1:22504','22505','22505','requestApprovedDecision',NULL,NULL,'Request approved?','exclusiveGateway',NULL,'2019-06-06 07:36:09.383','2019-06-06 07:36:09.389',6,'lsp_test'),('50003','vacationRequest:1:22504','22505','22505','adjustVacationRequestTask','50004',NULL,'Adjust vacation request','userTask','shengpengliu','2019-06-06 07:36:09.389','2019-06-10 02:48:43.055',328353666,'lsp_test'),('52503','vacationRequest:1:22504','22505','22505','resendRequestDecision',NULL,NULL,'Resend request?','exclusiveGateway',NULL,'2019-06-10 02:48:43.055','2019-06-10 02:48:43.060',5,'lsp_test'),('52504','vacationRequest:1:22504','22505','22505','handleRequest','52505',NULL,'Handle vacation request','userTask',NULL,'2019-06-10 02:48:43.060','2019-06-10 03:03:02.806',859746,'lsp_test'),('52509','vacationRequest:1:22504','22505','22505','requestApprovedDecision',NULL,NULL,'Request approved?','exclusiveGateway',NULL,'2019-06-10 03:03:02.806','2019-06-10 03:03:02.806',0,'lsp_test'),('52510','vacationRequest:1:22504','22505','22505','adjustVacationRequestTask','52511',NULL,'Adjust vacation request','userTask','shengpengliu','2019-06-10 03:03:02.806','2019-06-11 02:11:56.717',83333911,'lsp_test'),('55057','vacationRequest:1:22504','22505','22505','resendRequestDecision',NULL,NULL,'Resend request?','exclusiveGateway',NULL,'2019-06-11 02:11:56.717','2019-06-11 02:11:56.725',8,'lsp_test'),('55058','vacationRequest:1:22504','22505','22505','handleRequest','55059',NULL,'Handle vacation request','userTask',NULL,'2019-06-11 02:11:56.725',NULL,NULL,'lsp_test'),('7507','vacationRequest:1:7504','7505','7505','request',NULL,NULL,NULL,'startEvent',NULL,'2019-06-03 01:13:58.783','2019-06-03 01:13:58.809',26,'test1'),('7508','vacationRequest:1:7504','7505','7505','handleRequest','7509',NULL,'Handle vacation request','userTask',NULL,'2019-06-03 01:13:58.810','2019-06-03 02:50:59.036',5820226,'test1');

/*Table structure for table `act_hi_attachment` */

DROP TABLE IF EXISTS `act_hi_attachment`;

CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_attachment` */

/*Table structure for table `act_hi_comment` */

DROP TABLE IF EXISTS `act_hi_comment`;

CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_comment` */

insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('47501','comment','2019-06-06 07:25:38.421',NULL,'45008',NULL,'AddComment','dddddd','dddddd'),('50001','comment','2019-06-06 07:36:09.227',NULL,'47504',NULL,'AddComment','没有意见，好好活着！','没有意见，好好活着！'),('52501','comment','2019-06-10 02:48:42.861',NULL,'50004',NULL,'AddComment','没有意见，好好活着！','没有意见，好好活着！'),('52508','comment','2019-06-10 03:03:02.699',NULL,'52505',NULL,'AddComment','没有意见，好好活着！','没有意见，好好活着！'),('55031','comment','2019-06-11 02:11:56.612',NULL,'52511','22505','AddComment','没有意见，好好活着','没有意见，好好活着');

/*Table structure for table `act_hi_detail` */

DROP TABLE IF EXISTS `act_hi_detail`;

CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_detail` */

insert  into `act_hi_detail`(`ID_`,`TYPE_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`ACT_INST_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`TIME_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('55032','FormProperty','22505','22505','52511','52510','fname',NULL,NULL,'2019-06-11 02:11:56.620',NULL,NULL,NULL,'张三请假单',NULL),('55033','FormProperty','22505','22505','52511','52510','vacationMotivation',NULL,NULL,'2019-06-11 02:11:56.684',NULL,NULL,NULL,'',NULL),('55034','FormProperty','22505','22505','52511','52510','fbegindate',NULL,NULL,'2019-06-11 02:11:56.684',NULL,NULL,NULL,'2019-06-05',NULL),('55035','FormProperty','22505','22505','52511','52510','fapplyuser',NULL,NULL,'2019-06-11 02:11:56.684',NULL,NULL,NULL,'张三',NULL),('55036','FormProperty','22505','22505','52511','52510','numberOfDays',NULL,NULL,'2019-06-11 02:11:56.684',NULL,NULL,NULL,'',NULL),('55037','FormProperty','22505','22505','52511','52510','message',NULL,NULL,'2019-06-11 02:11:56.684',NULL,NULL,NULL,'没有意见，好好活着',NULL),('55038','FormProperty','22505','22505','52511','52510','fenddate',NULL,NULL,'2019-06-11 02:11:56.684',NULL,NULL,NULL,'2019-06-10',NULL),('55039','FormProperty','22505','22505','52511','52510','fapplyreason',NULL,NULL,'2019-06-11 02:11:56.684',NULL,NULL,NULL,'生病请假几天',NULL),('55040','FormProperty','22505','22505','52511','52510','fapplytype',NULL,NULL,'2019-06-11 02:11:56.684',NULL,NULL,NULL,'事假',NULL),('55041','FormProperty','22505','22505','52511','52510','processInstaceId',NULL,NULL,'2019-06-11 02:11:56.684',NULL,NULL,NULL,'22505',NULL),('55042','FormProperty','22505','22505','52511','52510','resendRequest',NULL,NULL,'2019-06-11 02:11:56.684',NULL,NULL,NULL,'true',NULL),('55043','FormProperty','22505','22505','52511','52510','startDate',NULL,NULL,'2019-06-11 02:11:56.684',NULL,NULL,NULL,'',NULL),('55044','FormProperty','22505','22505','52511','52510','fcode',NULL,NULL,'2019-06-11 02:11:56.684',NULL,NULL,NULL,'001',NULL);

/*Table structure for table `act_hi_identitylink` */

DROP TABLE IF EXISTS `act_hi_identitylink`;

CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_identitylink` */

insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('12516','management','candidate',NULL,'12515',NULL),('12530','management','candidate',NULL,'12529',NULL),('12544','management','candidate',NULL,'12543',NULL),('12562','management','candidate',NULL,'12561',NULL),('15004','management','candidate',NULL,'15003',NULL),('17513','management','candidate',NULL,'17512',NULL),('17528','management','candidate',NULL,'17527',NULL),('17573','management','candidate',NULL,'17572',NULL),('17589','management','candidate',NULL,'17588',NULL),('17605',NULL,'participant','lsp',NULL,'12537'),('17629','management','candidate',NULL,'17628',NULL),('22511','management','candidate',NULL,'22510',NULL),('22512','admin','candidate',NULL,'22510',NULL),('25001',NULL,'participant','shengpengliu',NULL,'22505'),('30007',NULL,'participant','lsp',NULL,'22505'),('32505','management','candidate',NULL,'32504',NULL),('35004','admin','candidate',NULL,'35003',NULL),('35005','management','candidate',NULL,'35003',NULL),('40004','management','candidate',NULL,'40003',NULL),('40005','admin','candidate',NULL,'40003',NULL),('40012','management','candidate',NULL,'40011',NULL),('40013','admin','candidate',NULL,'40011',NULL),('40020','management','candidate',NULL,'40019',NULL),('40021','admin','candidate',NULL,'40019',NULL),('40028','management','candidate',NULL,'40027',NULL),('40029','admin','candidate',NULL,'40027',NULL),('42504','admin','candidate',NULL,'42503',NULL),('42505','management','candidate',NULL,'42503',NULL),('45004','management','candidate',NULL,'45003',NULL),('45005','admin','candidate',NULL,'45003',NULL),('47505','management','candidate',NULL,'47504',NULL),('47506','admin','candidate',NULL,'47504',NULL),('52506','management','candidate',NULL,'52505',NULL),('52507','admin','candidate',NULL,'52505',NULL),('55060','management','candidate',NULL,'55059',NULL),('55061','admin','candidate',NULL,'55059',NULL),('7510','management','candidate',NULL,'7509',NULL);

/*Table structure for table `act_hi_procinst` */

DROP TABLE IF EXISTS `act_hi_procinst`;

CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_procinst` */

insert  into `act_hi_procinst`(`ID_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`) values ('12509','12509',NULL,'vacationRequest:1:7504','2019-06-03 03:03:25.070','2019-06-03 03:07:23.944',238874,NULL,'request','theEnd1',NULL,NULL,'test1',NULL),('12523','12523',NULL,'vacationRequest:1:7504','2019-06-03 03:08:38.690','2019-06-03 03:09:16.009',37319,NULL,'request','theEnd1',NULL,NULL,'test1',NULL),('12537','12537',NULL,'vacationRequest:1:7504','2019-06-03 03:11:32.361',NULL,NULL,NULL,'request',NULL,NULL,NULL,'test1',NULL),('17521','17521',NULL,'vacationRequest:1:7504','2019-06-03 04:34:31.213','2019-06-03 04:40:24.045',352832,NULL,'request','theEnd1',NULL,NULL,'test1',NULL),('17566','17566',NULL,'vacationRequest:1:7504','2019-06-03 04:54:59.687',NULL,NULL,NULL,'request',NULL,NULL,NULL,'test1',NULL),('17582','17582',NULL,'vacationRequest:1:7504','2019-06-03 04:59:26.810',NULL,NULL,NULL,'request',NULL,NULL,NULL,'test1',NULL),('22505','22505',NULL,'vacationRequest:1:22504','2019-06-03 14:33:30.108',NULL,NULL,NULL,'request',NULL,NULL,NULL,'lsp_test',NULL),('7505','7505',NULL,'vacationRequest:1:7504','2019-06-03 01:13:58.783','2019-06-03 02:50:59.049',5820266,NULL,'request','theEnd1',NULL,NULL,'test1',NULL);

/*Table structure for table `act_hi_taskinst` */

DROP TABLE IF EXISTS `act_hi_taskinst`;

CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_taskinst` */

insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`) values ('12515','vacationRequest:1:7504','handleRequest','12509','12509','Handle vacation request',NULL,'${employeeName} would like to take ${numberOfDays} day(s) of vacation (Motivation: ${vacationMotivation}).',NULL,NULL,'2019-06-03 03:03:25.076',NULL,'2019-06-03 03:07:23.920',238844,'completed',50,NULL,NULL,NULL,'test1'),('12529','vacationRequest:1:7504','handleRequest','12523','12523','Handle vacation request',NULL,'${employeeName} would like to take ${numberOfDays} day(s) of vacation (Motivation: ${vacationMotivation}).',NULL,NULL,'2019-06-03 03:08:38.693',NULL,'2019-06-03 03:09:16.005',37312,'completed',50,NULL,NULL,NULL,'test1'),('12543','vacationRequest:1:7504','handleRequest','12537','12537','Handle vacation request',NULL,'${employeeName} would like to take ${numberOfDays} day(s) of vacation (Motivation: ${vacationMotivation}).',NULL,NULL,'2019-06-03 03:11:32.363',NULL,'2019-06-03 03:13:22.704',110341,'completed',50,NULL,NULL,NULL,'test1'),('12554','vacationRequest:1:7504','adjustVacationRequestTask','12537','12537','Adjust vacation request',NULL,'Your manager has disapproved your vacation request for ${numberOfDays} days.\n        Reason: ${managerMotivation}',NULL,'shengpengliu','2019-06-03 03:13:22.706',NULL,'2019-06-03 03:26:29.545',786839,'completed',50,NULL,NULL,NULL,'test1'),('12561','vacationRequest:1:7504','handleRequest','12537','12537','Handle vacation request',NULL,' would like to take 12345645 day(s) of vacation (Motivation: lsp test).',NULL,'shengpengliu','2019-06-03 03:26:29.548',NULL,'2019-06-03 03:34:14.538',464990,'completed',50,NULL,NULL,NULL,'test1'),('12565','vacationRequest:1:7504','adjustVacationRequestTask','12537','12537','Adjust vacation request',NULL,'Your manager has disapproved your vacation request for 12345645 days.\n        Reason: true',NULL,'shengpengliu','2019-06-03 03:34:14.554',NULL,'2019-06-03 04:11:24.550',2229996,'completed',50,NULL,NULL,NULL,'test1'),('15003','vacationRequest:1:7504','handleRequest','12537','12537','Handle vacation request',NULL,' would like to take 11 day(s) of vacation (Motivation: lsp test).',NULL,'shengpengliu','2019-06-03 04:11:24.607',NULL,'2019-06-03 04:29:09.617',1065010,'completed',50,NULL,NULL,NULL,'test1'),('17509','vacationRequest:1:7504','adjustVacationRequestTask','12537','12537','Adjust vacation request',NULL,'Your manager has disapproved your vacation request for 11 days.\n        Reason: true',NULL,'shengpengliu','2019-06-03 04:29:09.638',NULL,'2019-06-03 04:31:05.980',116342,'completed',50,NULL,NULL,NULL,'test1'),('17512','vacationRequest:1:7504','handleRequest','12537','12537','Handle vacation request',NULL,' would like to take 11 day(s) of vacation (Motivation: lsp test).',NULL,NULL,'2019-06-03 04:31:05.984',NULL,'2019-06-03 05:34:08.660',3782676,'completed',50,NULL,NULL,NULL,'test1'),('17527','vacationRequest:1:7504','handleRequest','17521','17521','Handle vacation request',NULL,'${employeeName} would like to take ${numberOfDays} day(s) of vacation (Motivation: ${vacationMotivation}).',NULL,NULL,'2019-06-03 04:34:31.215',NULL,'2019-06-03 04:40:24.038',352823,'completed',50,NULL,NULL,NULL,'test1'),('17572','vacationRequest:1:7504','handleRequest','17566','17566','Handle vacation request',NULL,'${employeeName} would like to take ${numberOfDays} day(s) of vacation (Motivation: ${vacationMotivation}).',NULL,NULL,'2019-06-03 04:54:59.689',NULL,'2019-06-03 04:57:32.798',153109,'completed',50,NULL,NULL,NULL,'test1'),('17581','vacationRequest:1:7504','adjustVacationRequestTask','17566','17566','Adjust vacation request',NULL,'Your manager has disapproved your vacation request for ${numberOfDays} days.\n        Reason: ${managerMotivation}',NULL,NULL,'2019-06-03 04:57:32.814',NULL,'2019-06-03 05:38:11.235',2438421,'completed',50,NULL,NULL,NULL,'test1'),('17588','vacationRequest:1:7504','handleRequest','17582','17582','Handle vacation request',NULL,'${employeeName} would like to take ${numberOfDays} day(s) of vacation (Motivation: ${vacationMotivation}).',NULL,NULL,'2019-06-03 04:59:26.811',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'test1'),('17604','vacationRequest:1:7504','adjustVacationRequestTask','12537','12537','Adjust vacation request',NULL,'Your manager has disapproved your vacation request for ${numberOfDays} days.\n        Reason: ${managerMotivation}',NULL,'shengpengliu','2019-06-03 05:34:08.676',NULL,'2019-06-06 01:32:42.951',244714275,'completed',50,NULL,NULL,NULL,'test1'),('17628','vacationRequest:1:7504','handleRequest','17566','17566','Handle vacation request',NULL,'${employeeName} would like to take ${numberOfDays} day(s) of vacation (Motivation: ${vacationMotivation}).',NULL,'shengpengliu','2019-06-03 05:38:11.237',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'test1'),('22510','vacationRequest:1:22504','handleRequest','22505','22505','Handle vacation request',NULL,'${employeeName} would like to take ${numberOfDays} day(s) of vacation (Motivation: ${vacationMotivation}).',NULL,'shengpengliu','2019-06-03 14:33:30.125','2019-06-03 15:05:19.614','2019-06-04 05:40:13.936',54403811,'completed',50,NULL,NULL,NULL,'lsp_test'),('30006','vacationRequest:1:22504','adjustVacationRequestTask','22505','22505','Adjust vacation request',NULL,'Your manager has disapproved your vacation request for ${numberOfDays} days.\n        Reason: ${managerMotivation}',NULL,'shengpengliu','2019-06-04 05:40:13.956',NULL,'2019-06-06 01:41:26.152',158472196,'completed',50,NULL,NULL,NULL,'lsp_test'),('32504','vacationRequest:1:7504','handleRequest','12537','12537','Handle vacation request',NULL,'${employeeName} would like to take ${numberOfDays} day(s) of vacation (Motivation: ${vacationMotivation}).',NULL,'shengpengliu','2019-06-06 01:32:42.977',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'test1'),('35003','vacationRequest:1:22504','handleRequest','22505','22505','Handle vacation request',NULL,'${employeeName} would like to take ${numberOfDays} day(s) of vacation (Motivation: ${vacationMotivation}).',NULL,'shengpengliu','2019-06-06 01:41:26.206',NULL,'2019-06-06 01:44:45.787',199581,'completed',50,NULL,NULL,NULL,'lsp_test'),('37503','vacationRequest:1:22504','adjustVacationRequestTask','22505','22505','Adjust vacation request',NULL,'Your manager has disapproved your vacation request for ${numberOfDays} days.\n        Reason: ${managerMotivation}',NULL,'shengpengliu','2019-06-06 01:44:45.862',NULL,'2019-06-06 01:48:25.946',220084,'completed',50,NULL,NULL,NULL,'lsp_test'),('40003','vacationRequest:1:22504','handleRequest','22505','22505','Handle vacation request',NULL,'${employeeName} would like to take ${numberOfDays} day(s) of vacation (Motivation: ${vacationMotivation}).',NULL,'shengpengliu','2019-06-06 01:48:26.052',NULL,'2019-06-06 01:49:15.940',49888,'completed',50,NULL,NULL,NULL,'lsp_test'),('40008','vacationRequest:1:22504','adjustVacationRequestTask','22505','22505','Adjust vacation request',NULL,'Your manager has disapproved your vacation request for ${numberOfDays} days.\n        Reason: ${managerMotivation}',NULL,'shengpengliu','2019-06-06 01:49:15.945',NULL,'2019-06-06 01:49:35.527',19582,'completed',50,NULL,NULL,NULL,'lsp_test'),('40011','vacationRequest:1:22504','handleRequest','22505','22505','Handle vacation request',NULL,'${employeeName} would like to take ${numberOfDays} day(s) of vacation (Motivation: ${vacationMotivation}).',NULL,'shengpengliu','2019-06-06 01:49:35.530',NULL,'2019-06-06 01:55:17.967',342437,'completed',50,NULL,NULL,NULL,'lsp_test'),('40016','vacationRequest:1:22504','adjustVacationRequestTask','22505','22505','Adjust vacation request',NULL,'Your manager has disapproved your vacation request for ${numberOfDays} days.\n        Reason: ${managerMotivation}',NULL,'shengpengliu','2019-06-06 01:55:17.986',NULL,'2019-06-06 01:59:56.429',278443,'completed',50,NULL,NULL,NULL,'lsp_test'),('40019','vacationRequest:1:22504','handleRequest','22505','22505','Handle vacation request',NULL,'${employeeName} would like to take ${numberOfDays} day(s) of vacation (Motivation: ${vacationMotivation}).',NULL,'shengpengliu','2019-06-06 01:59:56.438','2019-06-06 02:00:26.087','2019-06-06 02:00:44.695',48257,'completed',50,NULL,NULL,NULL,'lsp_test'),('40024','vacationRequest:1:22504','adjustVacationRequestTask','22505','22505','Adjust vacation request',NULL,'Your manager has disapproved your vacation request for ${numberOfDays} days.\n        Reason: ${managerMotivation}',NULL,'shengpengliu','2019-06-06 02:00:44.698',NULL,'2019-06-06 02:02:26.222',101524,'completed',50,NULL,NULL,NULL,'lsp_test'),('40027','vacationRequest:1:22504','handleRequest','22505','22505','Handle vacation request',NULL,'${employeeName} would like to take ${numberOfDays} day(s) of vacation (Motivation: ${vacationMotivation}).',NULL,'shengpengliu','2019-06-06 02:02:26.226','2019-06-06 02:02:48.639','2019-06-06 02:02:58.786',32560,'completed',50,NULL,NULL,NULL,'lsp_test'),('40032','vacationRequest:1:22504','adjustVacationRequestTask','22505','22505','Adjust vacation request',NULL,'Your manager has disapproved your vacation request for ${numberOfDays} days.\n        Reason: ${managerMotivation}',NULL,'shengpengliu','2019-06-06 02:02:58.789',NULL,'2019-06-06 06:12:39.000',14980211,'completed',50,NULL,NULL,NULL,'lsp_test'),('42503','vacationRequest:1:22504','handleRequest','22505','22505','Handle vacation request',NULL,'${employeeName} would like to take ${numberOfDays} day(s) of vacation (Motivation: ${vacationMotivation}).',NULL,'shengpengliu','2019-06-06 06:12:39.056',NULL,'2019-06-06 06:14:01.057',82001,'completed',50,NULL,NULL,NULL,'lsp_test'),('42508','vacationRequest:1:22504','adjustVacationRequestTask','22505','22505','Adjust vacation request',NULL,'Your manager has disapproved your vacation request for ${numberOfDays} days.\n        Reason: ${managerMotivation}',NULL,'shengpengliu','2019-06-06 06:14:01.071',NULL,'2019-06-06 07:21:59.408',4078337,'completed',50,NULL,NULL,NULL,'lsp_test'),('45003','vacationRequest:1:22504','handleRequest','22505','22505','Handle vacation request',NULL,'${employeeName} would like to take ${numberOfDays} day(s) of vacation (Motivation: ${vacationMotivation}).',NULL,'shengpengliu','2019-06-06 07:21:59.470','2019-06-06 07:23:07.253','2019-06-06 07:23:32.317',92847,'completed',50,NULL,NULL,NULL,'lsp_test'),('45008','vacationRequest:1:22504','adjustVacationRequestTask','22505','22505','Adjust vacation request',NULL,'Your manager has disapproved your vacation request for ${numberOfDays} days.\n        Reason: ${managerMotivation}',NULL,'shengpengliu','2019-06-06 07:23:32.333',NULL,'2019-06-06 07:25:38.627',126294,'completed',50,NULL,NULL,NULL,'lsp_test'),('47504','vacationRequest:1:22504','handleRequest','22505','22505','Handle vacation request',NULL,'${employeeName} would like to take ${numberOfDays} day(s) of vacation (Motivation: ${vacationMotivation}).',NULL,'shengpengliu','2019-06-06 07:25:38.645','2019-06-06 07:35:39.921','2019-06-06 07:36:09.373',630728,'completed',50,NULL,NULL,NULL,'lsp_test'),('50004','vacationRequest:1:22504','adjustVacationRequestTask','22505','22505','Adjust vacation request',NULL,'Your manager has disapproved your vacation request for ${numberOfDays} days.\n        Reason: ${managerMotivation}',NULL,'shengpengliu','2019-06-06 07:36:09.389',NULL,'2019-06-10 02:48:43.043',328353654,'completed',50,NULL,NULL,NULL,'lsp_test'),('52505','vacationRequest:1:22504','handleRequest','22505','22505','Handle vacation request',NULL,'${employeeName} would like to take ${numberOfDays} day(s) of vacation (Motivation: ${vacationMotivation}).',NULL,NULL,'2019-06-10 02:48:43.060',NULL,'2019-06-10 03:03:02.778',859718,'completed',50,NULL,NULL,NULL,'lsp_test'),('52511','vacationRequest:1:22504','adjustVacationRequestTask','22505','22505','Adjust vacation request',NULL,'Your manager has disapproved your vacation request for ${numberOfDays} days.\n        Reason: ${managerMotivation}',NULL,'shengpengliu','2019-06-10 03:03:02.806','2019-06-11 01:55:17.893','2019-06-11 02:11:56.708',83333902,'completed',50,NULL,NULL,NULL,'lsp_test'),('55059','vacationRequest:1:22504','handleRequest','22505','22505','Handle vacation request',NULL,'shengpengliu would like to take  day(s) of vacation (Motivation: ).',NULL,NULL,'2019-06-11 02:11:56.726',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'lsp_test'),('7509','vacationRequest:1:7504','handleRequest','7505','7505','Handle vacation request',NULL,'${employeeName} would like to take ${numberOfDays} day(s) of vacation (Motivation: ${vacationMotivation}).',NULL,NULL,'2019-06-03 01:13:58.851',NULL,'2019-06-03 02:50:59.022',5820171,'completed',50,NULL,NULL,NULL,'test1');

/*Table structure for table `act_hi_varinst` */

DROP TABLE IF EXISTS `act_hi_varinst`;

CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_varinst` */

insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('12503','7505','7505',NULL,'vacationApproved','boolean',0,NULL,NULL,1,NULL,NULL,'2019-06-03 02:50:59.001','2019-06-03 02:50:59.055'),('12504','7505','7505',NULL,'managerMotivation','string',0,NULL,NULL,NULL,'lsp test',NULL,'2019-06-03 02:50:59.002','2019-06-03 02:50:59.055'),('12505','7505','7505',NULL,'doubleTaskVar','double',0,NULL,99.99,NULL,NULL,NULL,'2019-06-03 02:50:59.002','2019-06-03 02:50:59.055'),('12510','12509','12509',NULL,'employeeName','null',1,NULL,NULL,NULL,NULL,NULL,'2019-06-03 03:03:25.070','2019-06-03 03:07:23.960'),('12512','12509','12509',NULL,'name','string',1,NULL,NULL,NULL,'lsp',NULL,'2019-06-03 03:03:25.070','2019-06-03 03:07:23.960'),('12513','12509','12509',NULL,'age','string',1,NULL,NULL,NULL,'30',NULL,'2019-06-03 03:03:25.070','2019-06-03 03:07:23.960'),('12517','12509','12509',NULL,'vacationApproved','boolean',0,NULL,NULL,1,NULL,NULL,'2019-06-03 03:07:23.902','2019-06-03 03:07:23.960'),('12518','12509','12509',NULL,'managerMotivation','string',0,NULL,NULL,NULL,'lsp test',NULL,'2019-06-03 03:07:23.902','2019-06-03 03:07:23.960'),('12519','12509','12509',NULL,'doubleTaskVar','double',0,NULL,99.99,NULL,NULL,NULL,'2019-06-03 03:07:23.903','2019-06-03 03:07:23.960'),('12524','12523','12523',NULL,'employeeName','null',1,NULL,NULL,NULL,NULL,NULL,'2019-06-03 03:08:38.690','2019-06-03 03:09:16.011'),('12526','12523','12523',NULL,'name','string',1,NULL,NULL,NULL,'lsp',NULL,'2019-06-03 03:08:38.690','2019-06-03 03:09:16.011'),('12527','12523','12523',NULL,'age','string',1,NULL,NULL,NULL,'30',NULL,'2019-06-03 03:08:38.690','2019-06-03 03:09:16.011'),('12531','12523','12523',NULL,'vacationApproved','boolean',0,NULL,NULL,1,NULL,NULL,'2019-06-03 03:09:16.002','2019-06-03 03:09:16.011'),('12532','12523','12523',NULL,'managerMotivation','string',0,NULL,NULL,NULL,'lsp test',NULL,'2019-06-03 03:09:16.002','2019-06-03 03:09:16.011'),('12533','12523','12523',NULL,'doubleTaskVar','double',0,NULL,99.99,NULL,NULL,NULL,'2019-06-03 03:09:16.002','2019-06-03 03:09:16.011'),('12538','12537','12537',NULL,'employeeName','null',0,NULL,NULL,NULL,NULL,NULL,'2019-06-03 03:11:32.361','2019-06-03 03:11:32.361'),('12540','12537','12537',NULL,'name','string',0,NULL,NULL,NULL,'lsp',NULL,'2019-06-03 03:11:32.362','2019-06-03 03:11:32.362'),('12541','12537','12537',NULL,'age','string',0,NULL,NULL,NULL,'30',NULL,'2019-06-03 03:11:32.362','2019-06-03 03:11:32.362'),('12549','12537','12537',NULL,'vacationApproved','string',3,NULL,NULL,NULL,'false',NULL,'2019-06-03 03:13:22.701','2019-06-03 04:31:05.971'),('12550','12537','12537',NULL,'managerMotivation','string',3,NULL,NULL,NULL,'true',NULL,'2019-06-03 03:13:22.701','2019-06-03 04:31:05.972'),('12551','12537','12537',NULL,'doubleTaskVar','double',0,NULL,99.99,NULL,NULL,NULL,'2019-06-03 03:13:22.701','2019-06-03 03:13:22.701'),('12555','12537','12537',NULL,'vacationMotivation','string',3,NULL,NULL,NULL,'lsp test',NULL,'2019-06-03 03:26:29.542','2019-06-03 04:31:05.969'),('12556','12537','12537',NULL,'numberOfDays','string',3,NULL,NULL,NULL,'11',NULL,'2019-06-03 03:26:29.543','2019-06-03 04:31:05.973'),('12557','12537','12537',NULL,'resendRequest','string',3,NULL,NULL,NULL,'true',NULL,'2019-06-03 03:26:29.543','2019-06-03 04:31:05.974'),('12558','12537','12537',NULL,'startDate','string',3,NULL,NULL,NULL,'2019-08-08 11:25',NULL,'2019-06-03 03:26:29.543','2019-06-03 04:31:05.976'),('17501','12537','12537','15003','vacationMotivation','string',0,NULL,NULL,NULL,'lsp test',NULL,'2019-06-03 04:29:09.531','2019-06-03 04:29:09.531'),('17502','12537','12537','15003','vacationApproved','string',0,NULL,NULL,NULL,'false',NULL,'2019-06-03 04:29:09.531','2019-06-03 04:29:09.531'),('17503','12537','12537','15003','managerMotivation','string',0,NULL,NULL,NULL,'true',NULL,'2019-06-03 04:29:09.531','2019-06-03 04:29:09.531'),('17504','12537','12537','15003','numberOfDays','string',0,NULL,NULL,NULL,'11',NULL,'2019-06-03 04:29:09.531','2019-06-03 04:29:09.531'),('17505','12537','12537','15003','resendRequest','string',0,NULL,NULL,NULL,'true',NULL,'2019-06-03 04:29:09.531','2019-06-03 04:29:09.531'),('17506','12537','12537','15003','startDate','string',0,NULL,NULL,NULL,'2019-08-08 11:25',NULL,'2019-06-03 04:29:09.531','2019-06-03 04:29:09.531'),('17522','17521','17521',NULL,'employeeName','null',1,NULL,NULL,NULL,NULL,NULL,'2019-06-03 04:34:31.213','2019-06-03 04:40:24.051'),('17524','17521','17521',NULL,'name','string',1,NULL,NULL,NULL,'lsp',NULL,'2019-06-03 04:34:31.213','2019-06-03 04:40:24.051'),('17525','17521','17521',NULL,'age','string',1,NULL,NULL,NULL,'30',NULL,'2019-06-03 04:34:31.213','2019-06-03 04:40:24.051'),('17561','17521','17521',NULL,'vacationApproved','string',0,NULL,NULL,NULL,'true',NULL,'2019-06-03 04:40:24.032','2019-06-03 04:40:24.051'),('17562','17521','17521',NULL,'managerMotivation','string',0,NULL,NULL,NULL,'true',NULL,'2019-06-03 04:40:24.032','2019-06-03 04:40:24.051'),('17567','17566','17566',NULL,'employeeName','string',1,NULL,NULL,NULL,'lsp',NULL,'2019-06-03 04:54:59.687','2019-06-03 05:38:11.233'),('17569','17566','17566',NULL,'name','string',0,NULL,NULL,NULL,'lsp',NULL,'2019-06-03 04:54:59.687','2019-06-03 04:54:59.687'),('17570','17566','17566',NULL,'age','string',0,NULL,NULL,NULL,'30',NULL,'2019-06-03 04:54:59.687','2019-06-03 04:54:59.687'),('17577','17566','17566',NULL,'vacationApproved','string',1,NULL,NULL,NULL,'false',NULL,'2019-06-03 04:57:32.781','2019-06-03 05:38:11.233'),('17578','17566','17566',NULL,'managerMotivation','string',1,NULL,NULL,NULL,'true',NULL,'2019-06-03 04:57:32.781','2019-06-03 05:38:11.234'),('17583','17582','17582',NULL,'employeeName','null',0,NULL,NULL,NULL,NULL,NULL,'2019-06-03 04:59:26.810','2019-06-03 04:59:26.810'),('17585','17582','17582',NULL,'name','string',0,NULL,NULL,NULL,'lsp',NULL,'2019-06-03 04:59:26.810','2019-06-03 04:59:26.810'),('17586','17582','17582',NULL,'age','string',0,NULL,NULL,NULL,'30',NULL,'2019-06-03 04:59:26.810','2019-06-03 04:59:26.810'),('17590','17566','17566','17581','myTaskVariable','string',0,NULL,NULL,NULL,'Hello my friend',NULL,'2019-06-03 05:01:43.131','2019-06-03 05:01:43.131'),('17591','17582','17582',NULL,'name1','string',0,NULL,NULL,NULL,'lsp',NULL,'2019-06-03 05:08:21.856','2019-06-03 05:08:21.856'),('17592','17582','17582','17588','name_lsp','string',1,NULL,NULL,NULL,'name_lsp',NULL,'2019-06-03 05:08:44.555','2019-06-03 05:28:31.621'),('17593','17582','17582','17588','name','string',0,NULL,NULL,NULL,'lsp1',NULL,'2019-06-03 05:24:41.027','2019-06-03 05:24:41.027'),('17599','12537','12537',NULL,'employeeName','string',1,NULL,NULL,NULL,'lsp',NULL,'2019-06-03 05:34:08.651','2019-06-06 01:32:42.798'),('17600','12537','12537',NULL,'vacationApproved','string',1,NULL,NULL,NULL,'false',NULL,'2019-06-03 05:34:08.651','2019-06-06 01:32:42.800'),('17601','12537','12537',NULL,'managerMotivation','string',1,NULL,NULL,NULL,'true',NULL,'2019-06-03 05:34:08.651','2019-06-06 01:32:42.801'),('17625','17566','17566',NULL,'resendRequest','string',0,NULL,NULL,NULL,'true',NULL,'2019-06-03 05:38:11.234','2019-06-03 05:38:11.234'),('22506','22505','22505',NULL,'employeeName','string',19,NULL,NULL,NULL,'shengpengliu',NULL,'2019-06-03 14:33:30.107','2019-06-10 03:03:02.774'),('22508','22505','22505',NULL,'myVar','string',0,NULL,NULL,NULL,'This is a variable',NULL,'2019-06-03 14:33:30.108','2019-06-03 14:33:30.108'),('30001','22505','22505',NULL,'vacationApproved','string',18,NULL,NULL,NULL,'false',NULL,'2019-06-04 05:40:13.825','2019-06-10 03:03:02.774'),('30002','22505','22505',NULL,'managerMotivation','string',18,NULL,NULL,NULL,'true',NULL,'2019-06-04 05:40:13.825','2019-06-10 03:03:02.775'),('30003','22505','22505',NULL,'resendRequest','string',19,NULL,NULL,NULL,'true',NULL,'2019-06-04 05:40:13.825','2019-06-11 02:11:56.698'),('32501','12537','12537',NULL,'resendRequest','string',0,NULL,NULL,NULL,'true',NULL,'2019-06-06 01:32:42.833','2019-06-06 01:32:42.833'),('52502','22505','22505',NULL,'name','string',1,NULL,NULL,NULL,'shengpengliu111',NULL,'2019-06-10 02:48:42.968','2019-06-10 03:03:02.775'),('52512','22505','22505','52511','name','string',0,NULL,NULL,NULL,'lsp1',NULL,'2019-06-10 03:06:11.014','2019-06-10 03:06:11.014'),('55045','22505','22505',NULL,'numberOfDays','null',0,NULL,NULL,NULL,NULL,NULL,'2019-06-11 02:11:56.691','2019-06-11 02:11:56.691'),('55046','22505','22505',NULL,'startDate','null',0,NULL,NULL,NULL,NULL,NULL,'2019-06-11 02:11:56.693','2019-06-11 02:11:56.693'),('55047','22505','22505',NULL,'vacationMotivation','string',0,NULL,NULL,NULL,'',NULL,'2019-06-11 02:11:56.693','2019-06-11 02:11:56.693'),('55048','22505','22505',NULL,'fname','string',0,NULL,NULL,NULL,'张三请假单',NULL,'2019-06-11 02:11:56.698','2019-06-11 02:11:56.698'),('55049','22505','22505',NULL,'fbegindate','string',0,NULL,NULL,NULL,'2019-06-05',NULL,'2019-06-11 02:11:56.698','2019-06-11 02:11:56.698'),('55050','22505','22505',NULL,'fapplyuser','string',0,NULL,NULL,NULL,'张三',NULL,'2019-06-11 02:11:56.698','2019-06-11 02:11:56.698'),('55051','22505','22505',NULL,'message','string',0,NULL,NULL,NULL,'没有意见，好好活着',NULL,'2019-06-11 02:11:56.698','2019-06-11 02:11:56.698'),('55052','22505','22505',NULL,'fenddate','string',0,NULL,NULL,NULL,'2019-06-10',NULL,'2019-06-11 02:11:56.698','2019-06-11 02:11:56.698'),('55053','22505','22505',NULL,'fapplyreason','string',0,NULL,NULL,NULL,'生病请假几天',NULL,'2019-06-11 02:11:56.698','2019-06-11 02:11:56.698'),('55054','22505','22505',NULL,'fapplytype','string',0,NULL,NULL,NULL,'事假',NULL,'2019-06-11 02:11:56.698','2019-06-11 02:11:56.698'),('55055','22505','22505',NULL,'processInstaceId','string',0,NULL,NULL,NULL,'22505',NULL,'2019-06-11 02:11:56.698','2019-06-11 02:11:56.698'),('55056','22505','22505',NULL,'fcode','string',0,NULL,NULL,NULL,'001',NULL,'2019-06-11 02:11:56.698','2019-06-11 02:11:56.698'),('7506','7505','7505',NULL,'employeeName','null',1,NULL,NULL,NULL,NULL,NULL,'2019-06-03 01:13:58.782','2019-06-03 02:50:59.055');

/*Table structure for table `act_id_group` */

DROP TABLE IF EXISTS `act_id_group`;

CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_group` */

insert  into `act_id_group`(`ID_`,`REV_`,`NAME_`,`TYPE_`) values ('admin',1,'admin',NULL),('test',1,'test',NULL);

/*Table structure for table `act_id_info` */

DROP TABLE IF EXISTS `act_id_info`;

CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_info` */

/*Table structure for table `act_id_membership` */

DROP TABLE IF EXISTS `act_id_membership`;

CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_membership` */

insert  into `act_id_membership`(`USER_ID_`,`GROUP_ID_`) values ('admin','admin'),('shengpengliu','admin'),('shengpengliu','test');

/*Table structure for table `act_id_user` */

DROP TABLE IF EXISTS `act_id_user`;

CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_user` */

insert  into `act_id_user`(`ID_`,`REV_`,`FIRST_`,`LAST_`,`EMAIL_`,`PWD_`,`PICTURE_ID_`) values ('admin',1,'admin','admin','617477558@qq.com','111111',NULL),('shengpengliu',1,'shengpeng','liu','617477558@qq.com','111111',NULL);

/*Table structure for table `act_procdef_info` */

DROP TABLE IF EXISTS `act_procdef_info`;

CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_procdef_info` */

/*Table structure for table `act_re_deployment` */

DROP TABLE IF EXISTS `act_re_deployment`;

CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_deployment` */

insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`TENANT_ID_`,`DEPLOY_TIME_`) values ('1','SpringAutoDeployment',NULL,'','2019-05-30 13:53:08.017'),('20001','SpringAutoDeployment',NULL,'','2019-06-03 14:07:15.062'),('22501','vacationRequest.bpmn20.xml',NULL,'lsp_test','2019-06-03 14:29:05.533'),('2501','SpringAutoDeployment',NULL,'','2019-05-31 06:47:58.185'),('27501','SpringAutoDeployment',NULL,'','2019-06-04 01:34:45.159'),('5001','basic.bpmn20.xml',NULL,'10,10','2019-05-31 08:22:00.926'),('7501','test.bpmn20.xml',NULL,'test1','2019-06-03 01:12:18.839');

/*Table structure for table `act_re_model` */

DROP TABLE IF EXISTS `act_re_model`;

CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_model` */

/*Table structure for table `act_re_procdef` */

DROP TABLE IF EXISTS `act_re_procdef`;

CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_procdef` */

insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`) values ('vacationRequest:1:22504',1,'http://activiti.org/bpmn20','Vacation request','vacationRequest',1,'22501','vacationRequest.bpmn20.xml','vacationRequest.vacationRequest.png',NULL,0,1,1,'lsp_test'),('vacationRequest:1:7504',1,'http://activiti.org/bpmn20','Vacation request','vacationRequest',1,'7501','test.bpmn20.xml','test.vacationRequest.png',NULL,0,1,1,'test1'),('waiter2:1:4',1,'processDefinitions',NULL,'waiter2',1,'1','D:\\openSource\\Learn.demo\\activity\\target\\classes\\processes\\basic2.bpmn',NULL,NULL,0,0,1,''),('waiter2:2:2505',1,'processDefinitions',NULL,'waiter2',2,'2501','X:\\source\\LIFT\\51-Demo\\newFlow\\com.yss.sofa.simpleflow\\target\\classes\\processes\\basic2.bpmn',NULL,NULL,0,0,1,''),('waiter2:3:20005',1,'processDefinitions',NULL,'waiter2',3,'20001','/Users/lsp/workcode/openSource/com.yss.sofa.simpleflow/target/classes/processes/basic2.bpmn',NULL,NULL,0,0,1,''),('waiter2:4:27505',1,'processDefinitions',NULL,'waiter2',4,'27501','X:\\source\\LIFT\\51-Demo\\newFlow\\com.yss.sofa.simpleflow\\target\\classes\\processes\\basic2.bpmn',NULL,NULL,0,0,1,''),('waiter:1:5',1,'processDefinitions',NULL,'waiter',1,'1','D:\\openSource\\Learn.demo\\activity\\target\\classes\\processes\\basic.bpmn20.xml',NULL,NULL,0,0,1,''),('waiter:1:5003',1,'processDefinitions',NULL,'waiter',1,'5001','basic.bpmn20.xml',NULL,NULL,0,0,1,'10,10'),('waiter:2:2504',1,'processDefinitions',NULL,'waiter',2,'2501','X:\\source\\LIFT\\51-Demo\\newFlow\\com.yss.sofa.simpleflow\\target\\classes\\processes\\basic.bpmn20.xml',NULL,NULL,0,0,1,''),('waiter:3:20004',1,'processDefinitions',NULL,'waiter',3,'20001','/Users/lsp/workcode/openSource/com.yss.sofa.simpleflow/target/classes/processes/basic.bpmn20.xml',NULL,NULL,0,0,1,''),('waiter:4:27504',1,'processDefinitions',NULL,'waiter',4,'27501','X:\\source\\LIFT\\51-Demo\\newFlow\\com.yss.sofa.simpleflow\\target\\classes\\processes\\basic.bpmn20.xml',NULL,NULL,0,0,1,'');

/*Table structure for table `act_ru_event_subscr` */

DROP TABLE IF EXISTS `act_ru_event_subscr`;

CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_event_subscr` */

/*Table structure for table `act_ru_execution` */

DROP TABLE IF EXISTS `act_ru_execution`;

CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_execution` */

insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`LOCK_TIME_`) values ('12537',9,'12537',NULL,NULL,'vacationRequest:1:7504',NULL,'handleRequest',1,0,1,0,1,2,'test1',NULL,NULL),('17566',3,'17566',NULL,NULL,'vacationRequest:1:7504',NULL,'handleRequest',1,0,1,0,1,2,'test1',NULL,NULL),('17582',2,'17582',NULL,NULL,'vacationRequest:1:7504',NULL,'handleRequest',1,0,1,0,1,2,'test1',NULL,NULL),('22505',21,'22505',NULL,NULL,'vacationRequest:1:22504',NULL,'handleRequest',1,0,1,0,1,2,'lsp_test',NULL,NULL);

/*Table structure for table `act_ru_identitylink` */

DROP TABLE IF EXISTS `act_ru_identitylink`;

CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_identitylink` */

insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`) values ('17589',1,'management','candidate',NULL,'17588',NULL,NULL),('17605',1,NULL,'participant','shengpengliu',NULL,'12537',NULL),('17629',1,'management','candidate',NULL,'17628',NULL,NULL),('25001',1,NULL,'participant','shengpengliu',NULL,'22505',NULL),('30007',1,NULL,'participant','lsp',NULL,'22505',NULL),('32505',1,'management','candidate',NULL,'32504',NULL,NULL),('55060',1,'management','candidate',NULL,'55059',NULL,NULL),('55061',1,'admin','candidate',NULL,'55059',NULL,NULL);

/*Table structure for table `act_ru_job` */

DROP TABLE IF EXISTS `act_ru_job`;

CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_job` */

/*Table structure for table `act_ru_task` */

DROP TABLE IF EXISTS `act_ru_task`;

CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_task` */

insert  into `act_ru_task`(`ID_`,`REV_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`TASK_DEF_KEY_`,`OWNER_`,`ASSIGNEE_`,`DELEGATION_`,`PRIORITY_`,`CREATE_TIME_`,`DUE_DATE_`,`CATEGORY_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`FORM_KEY_`) values ('17588',4,'17582','17582','vacationRequest:1:7504','Handle vacation request',NULL,'${employeeName} would like to take ${numberOfDays} day(s) of vacation (Motivation: ${vacationMotivation}).','handleRequest',NULL,NULL,NULL,50,'2019-06-03 04:59:26.810',NULL,NULL,1,'test1',NULL),('17628',1,'17566','17566','vacationRequest:1:7504','Handle vacation request',NULL,'${employeeName} would like to take ${numberOfDays} day(s) of vacation (Motivation: ${vacationMotivation}).','handleRequest',NULL,NULL,NULL,50,'2019-06-03 05:38:11.237',NULL,NULL,1,'test1',NULL),('32504',1,'12537','12537','vacationRequest:1:7504','Handle vacation request',NULL,'${employeeName} would like to take ${numberOfDays} day(s) of vacation (Motivation: ${vacationMotivation}).','handleRequest',NULL,NULL,NULL,50,'2019-06-06 01:32:42.977',NULL,NULL,1,'test1',NULL),('55059',1,'22505','22505','vacationRequest:1:22504','Handle vacation request',NULL,'shengpengliu would like to take  day(s) of vacation (Motivation: ).','handleRequest',NULL,NULL,NULL,50,'2019-06-11 02:11:56.726',NULL,NULL,1,'lsp_test',NULL);

/*Table structure for table `act_ru_variable` */

DROP TABLE IF EXISTS `act_ru_variable`;

CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_variable` */

insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('17567',2,'string','employeeName','17566','17566',NULL,NULL,NULL,NULL,'lsp',NULL),('17569',1,'string','name','17566','17566',NULL,NULL,NULL,NULL,'lsp',NULL),('17570',1,'string','age','17566','17566',NULL,NULL,NULL,NULL,'30',NULL),('17577',1,'string','vacationApproved','17566','17566',NULL,NULL,NULL,NULL,'false',NULL),('17578',1,'string','managerMotivation','17566','17566',NULL,NULL,NULL,NULL,'true',NULL),('17583',1,'null','employeeName','17582','17582',NULL,NULL,NULL,NULL,NULL,NULL),('17585',1,'string','name','17582','17582',NULL,NULL,NULL,NULL,'lsp',NULL),('17586',1,'string','age','17582','17582',NULL,NULL,NULL,NULL,'30',NULL),('17591',1,'string','name1','17582','17582',NULL,NULL,NULL,NULL,'lsp',NULL),('17592',2,'string','name_lsp','17582','17582','17588',NULL,NULL,NULL,'name_lsp',NULL),('17593',1,'string','name','17582','17582','17588',NULL,NULL,NULL,'lsp1',NULL),('17599',1,'string','employeeName','12537','12537',NULL,NULL,NULL,NULL,'lsp',NULL),('17600',1,'string','vacationApproved','12537','12537',NULL,NULL,NULL,NULL,'false',NULL),('17601',1,'string','managerMotivation','12537','12537',NULL,NULL,NULL,NULL,'true',NULL),('17625',1,'string','resendRequest','17566','17566',NULL,NULL,NULL,NULL,'true',NULL),('22506',5,'string','employeeName','22505','22505',NULL,NULL,NULL,NULL,'shengpengliu',NULL),('22508',1,'string','myVar','22505','22505',NULL,NULL,NULL,NULL,'This is a variable',NULL),('30001',1,'string','vacationApproved','22505','22505',NULL,NULL,NULL,NULL,'false',NULL),('30002',1,'string','managerMotivation','22505','22505',NULL,NULL,NULL,NULL,'true',NULL),('30003',1,'string','resendRequest','22505','22505',NULL,NULL,NULL,NULL,'true',NULL),('32501',1,'string','resendRequest','12537','12537',NULL,NULL,NULL,NULL,'true',NULL),('52502',2,'string','name','22505','22505',NULL,NULL,NULL,NULL,'shengpengliu111',NULL),('55045',1,'null','numberOfDays','22505','22505',NULL,NULL,NULL,NULL,NULL,NULL),('55046',1,'null','startDate','22505','22505',NULL,NULL,NULL,NULL,NULL,NULL),('55047',1,'string','vacationMotivation','22505','22505',NULL,NULL,NULL,NULL,'',NULL),('55048',1,'string','fname','22505','22505',NULL,NULL,NULL,NULL,'张三请假单',NULL),('55049',1,'string','fbegindate','22505','22505',NULL,NULL,NULL,NULL,'2019-06-05',NULL),('55050',1,'string','fapplyuser','22505','22505',NULL,NULL,NULL,NULL,'张三',NULL),('55051',1,'string','message','22505','22505',NULL,NULL,NULL,NULL,'没有意见，好好活着',NULL),('55052',1,'string','fenddate','22505','22505',NULL,NULL,NULL,NULL,'2019-06-10',NULL),('55053',1,'string','fapplyreason','22505','22505',NULL,NULL,NULL,NULL,'生病请假几天',NULL),('55054',1,'string','fapplytype','22505','22505',NULL,NULL,NULL,NULL,'事假',NULL),('55055',1,'string','processInstaceId','22505','22505',NULL,NULL,NULL,NULL,'22505',NULL),('55056',1,'string','fcode','22505','22505',NULL,NULL,NULL,NULL,'001',NULL);

/*Table structure for table `t_hi_order_task` */

DROP TABLE IF EXISTS `t_hi_order_task`;

CREATE TABLE `t_hi_order_task` (
  `id` bigint(100) NOT NULL AUTO_INCREMENT,
  `task_id` bigint(100) DEFAULT NULL,
  `order_name` varchar(100) DEFAULT NULL,
  `creater` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `t_hi_order_task` */

insert  into `t_hi_order_task`(`id`,`task_id`,`order_name`,`creater`) values (1,22510,'test1','lsp'),(2,40003,'shengpengliu_test_order_task','shengpengliu'),(3,40008,'shengpengliu_test_order_task','shengpengliu'),(4,40011,'shengpengliu_test_order_task','shengpengliu'),(5,40016,'shengpengliu_test_order_task','shengpengliu'),(6,40024,'shengpengliu_test_order_task','shengpengliu'),(7,40027,'shengpengliu_test_order_task','shengpengliu'),(8,40032,'shengpengliu_test_order_task','shengpengliu'),(9,45003,'shengpengliu_test_order_task','shengpengliu');

/*Table structure for table `t_hi_vacation` */

DROP TABLE IF EXISTS `t_hi_vacation`;

CREATE TABLE `t_hi_vacation` (
  `task_id` varchar(255) DEFAULT NULL,
  `id` bigint(100) NOT NULL AUTO_INCREMENT,
  `fcode` varchar(255) DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `fapplyuser` varchar(255) DEFAULT NULL,
  `fapplytype` varchar(255) DEFAULT NULL,
  `fbegindate` timestamp(3) NULL DEFAULT NULL,
  `fenddate` timestamp(3) NULL DEFAULT NULL,
  `fapplyreason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `t_hi_vacation` */

insert  into `t_hi_vacation`(`task_id`,`id`,`fcode`,`fname`,`fapplyuser`,`fapplytype`,`fbegindate`,`fenddate`,`fapplyreason`) values ('42503',1,'001','张三请假单','张三','事假','2019-06-05 00:00:00.000','2019-06-10 00:00:00.000','生病请假几天'),('42508',2,'001','张三请假单','张三','事假','2019-06-05 00:00:00.000','2019-06-10 00:00:00.000','生病请假几天'),('45008',3,'001','张三请假单','张三','事假','2019-06-05 00:00:00.000','2019-06-10 00:00:00.000','生病请假几天'),('47504',4,'001','张三请假单','张三','事假','2019-06-05 00:00:00.000','2019-06-10 00:00:00.000','生病请假几天'),('50004',5,'001','张三请假单','张三','事假','2019-06-05 00:00:00.000','2019-06-10 00:00:00.000','生病请假几天'),('52505',6,'001','张三请假单','张三','事假','2019-06-05 00:00:00.000','2019-06-10 00:00:00.000','生病请假几天'),('52511',7,'001','张三请假单','张三','事假','2019-06-05 00:00:00.000','2019-06-10 00:00:00.000','生病请假几天'),('55059',8,'001','张三请假单','张三','事假','2019-06-05 00:00:00.000','2019-06-10 00:00:00.000','生病请假几天');

/*Table structure for table `t_order_task` */

DROP TABLE IF EXISTS `t_order_task`;

CREATE TABLE `t_order_task` (
  `id` bigint(100) NOT NULL AUTO_INCREMENT,
  `task_id` bigint(100) DEFAULT NULL,
  `order_name` varchar(100) DEFAULT NULL,
  `creater` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `t_order_task` */

insert  into `t_order_task`(`id`,`task_id`,`order_name`,`creater`) values (5,40016,'shengpengliu_test_order_task','shengpengliu'),(8,40032,'shengpengliu_test_order_task','shengpengliu'),(9,45003,'shengpengliu_test_order_task','shengpengliu');

/*Table structure for table `t_project_group` */

DROP TABLE IF EXISTS `t_project_group`;

CREATE TABLE `t_project_group` (
  `id` bigint(100) NOT NULL AUTO_INCREMENT,
  `group_id` varchar(100) DEFAULT NULL,
  `project_id` varchar(100) DEFAULT NULL,
  `is_leader_group` bigint(1) DEFAULT NULL COMMENT '0-不是领导组，1-是领导组',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_group_project` (`group_id`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_project_group` */

/*Table structure for table `t_vacation` */

DROP TABLE IF EXISTS `t_vacation`;

CREATE TABLE `t_vacation` (
  `task_id` varchar(255) DEFAULT NULL,
  `id` bigint(100) NOT NULL AUTO_INCREMENT,
  `fcode` varchar(255) DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `fapplyuser` varchar(255) DEFAULT NULL,
  `fapplytype` varchar(255) DEFAULT NULL,
  `fbegindate` timestamp(3) NULL DEFAULT NULL,
  `fenddate` timestamp(3) NULL DEFAULT NULL,
  `fapplyreason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_task_id` (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `t_vacation` */

insert  into `t_vacation`(`task_id`,`id`,`fcode`,`fname`,`fapplyuser`,`fapplytype`,`fbegindate`,`fenddate`,`fapplyreason`) values ('55059',8,'001','张三请假单','张三','事假','2019-06-05 00:00:00.000','2019-06-10 00:00:00.000','生病请假几天');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
