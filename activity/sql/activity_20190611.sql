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

insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('2',1,'D:\\openSource\\Learn.demo\\activity\\target\\classes\\processes\\basic2.bpmn','1','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<!--\r\n* Copyright 2012-2014 the original author or authors.\r\n*\r\n* Licensed under the Apache License, Version 2.0 (the \"License\");\r\n* you may not use this file except in compliance with the License.\r\n* You may obtain a copy of the License at\r\n*\r\n*      http://www.apache.org/licenses/LICENSE-2.0\r\n*\r\n* Unless required by applicable law or agreed to in writing, software\r\n* distributed under the License is distributed on an \"AS IS\" BASIS,\r\n* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.\r\n* See the License for the specific language governing permissions and\r\n* limitations under the License.\r\n-->\r\n<definitions id=\"processDefinitions\"\r\n             xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\"\r\n             xmlns:activiti=\"http://activiti.org/bpmn\"\r\n             targetNamespace=\"processDefinitions\">\r\n\r\n    <process id=\"waiter2\">\r\n\r\n        <startEvent id=\"start\"/>\r\n\r\n        <sequenceFlow id=\"flow1\" sourceRef=\"start\" targetRef=\"service1\"/>\r\n\r\n        <scriptTask id=\"service1\" scriptFormat=\"groovy\">\r\n            <script>\r\n               println \'customerId=\' + customerId\r\n            </script>\r\n        </scriptTask>\r\n\r\n        <sequenceFlow id=\"flow2\" sourceRef=\"service1\" targetRef=\"end\"/>\r\n\r\n        <endEvent id=\"end\"/>\r\n\r\n    </process>\r\n\r\n</definitions>',0),('20002',1,'/Users/lsp/workcode/openSource/com.yss.sofa.simpleflow/target/classes/processes/basic.bpmn20.xml','20001','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<!--\r\n* Copyright 2012-2014 the original author or authors.\r\n*\r\n* Licensed under the Apache License, Version 2.0 (the \"License\");\r\n* you may not use this file except in compliance with the License.\r\n* You may obtain a copy of the License at\r\n*\r\n*      http://www.apache.org/licenses/LICENSE-2.0\r\n*\r\n* Unless required by applicable law or agreed to in writing, software\r\n* distributed under the License is distributed on an \"AS IS\" BASIS,\r\n* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.\r\n* See the License for the specific language governing permissions and\r\n* limitations under the License.\r\n-->\r\n<definitions id=\"processDefinitions\"\r\n             xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\"\r\n             xmlns:activiti=\"http://activiti.org/bpmn\"\r\n             targetNamespace=\"processDefinitions\">\r\n\r\n    <process id=\"waiter\">\r\n\r\n        <startEvent id=\"start\"/>\r\n\r\n        <sequenceFlow id=\"flow1\" sourceRef=\"start\" targetRef=\"service1\"/>\r\n\r\n        <scriptTask id=\"service1\" scriptFormat=\"groovy\">\r\n            <script>\r\n               println \'customerId=\' + customerId\r\n            </script>\r\n        </scriptTask>\r\n\r\n        <sequenceFlow id=\"flow2\" sourceRef=\"service1\" targetRef=\"end\"/>\r\n\r\n        <endEvent id=\"end\"/>\r\n\r\n    </process>\r\n\r\n</definitions>',0),('20003',1,'/Users/lsp/workcode/openSource/com.yss.sofa.simpleflow/target/classes/processes/basic2.bpmn','20001','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<!--\r\n* Copyright 2012-2014 the original author or authors.\r\n*\r\n* Licensed under the Apache License, Version 2.0 (the \"License\");\r\n* you may not use this file except in compliance with the License.\r\n* You may obtain a copy of the License at\r\n*\r\n*      http://www.apache.org/licenses/LICENSE-2.0\r\n*\r\n* Unless required by applicable law or agreed to in writing, software\r\n* distributed under the License is distributed on an \"AS IS\" BASIS,\r\n* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.\r\n* See the License for the specific language governing permissions and\r\n* limitations under the License.\r\n-->\r\n<definitions id=\"processDefinitions\"\r\n             xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\"\r\n             xmlns:activiti=\"http://activiti.org/bpmn\"\r\n             targetNamespace=\"processDefinitions\">\r\n\r\n    <process id=\"waiter2\">\r\n\r\n        <startEvent id=\"start\"/>\r\n\r\n        <sequenceFlow id=\"flow1\" sourceRef=\"start\" targetRef=\"service1\"/>\r\n\r\n        <scriptTask id=\"service1\" scriptFormat=\"groovy\">\r\n            <script>\r\n               println \'customerId=\' + customerId\r\n            </script>\r\n        </scriptTask>\r\n\r\n        <sequenceFlow id=\"flow2\" sourceRef=\"service1\" targetRef=\"end\"/>\r\n\r\n        <endEvent id=\"end\"/>\r\n\r\n    </process>\r\n\r\n</definitions>',0),('22502',1,'vacationRequest.bpmn20.xml','22501','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://activiti.org/bpmn20\">\n  <process id=\"vacationRequest\" name=\"Vacation request\" isExecutable=\"true\">\n    <startEvent id=\"request\" activiti:initiator=\"employeeName\">\n      <extensionElements>\n        <activiti:formProperty id=\"numberOfDays\" name=\"Number of days\" type=\"long\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"startDate\" name=\"First day of holiday (dd-MM-yyy)\" type=\"date\" datePattern=\"dd-MM-yyyy hh:mm\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"vacationMotivation\" name=\"Motivation\" type=\"string\"></activiti:formProperty>\n      </extensionElements>\n    </startEvent>\n    <sequenceFlow id=\"flow1\" sourceRef=\"request\" targetRef=\"handleRequest\"></sequenceFlow>\n    <userTask id=\"handleRequest\" name=\"Handle vacation request\" activiti:candidateGroups=\"management,admin\">\n      <documentation>${employeeName} would like to take ${numberOfDays} day(s) of vacation (Motivation: ${vacationMotivation}).</documentation>\n      <extensionElements>\n        <activiti:formProperty id=\"vacationApproved\" name=\"Do you approve this vacation\" type=\"enum\" required=\"true\">\n          <activiti:value id=\"true\" name=\"Approve\"></activiti:value>\n          <activiti:value id=\"false\" name=\"Reject\"></activiti:value>\n        </activiti:formProperty>\n        <activiti:formProperty id=\"managerMotivation\" name=\"Motivation\" type=\"string\"></activiti:formProperty>\n      </extensionElements>\n    </userTask>\n    <exclusiveGateway id=\"requestApprovedDecision\" name=\"Request approved?\"></exclusiveGateway>\n    <sequenceFlow id=\"flow3\" sourceRef=\"requestApprovedDecision\" targetRef=\"sendApprovalMail\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${vacationApproved == \'true\'}]]></conditionExpression>\n    </sequenceFlow>\n    <manualTask id=\"sendApprovalMail\" name=\"Send confirmation e-mail\"></manualTask>\n    <sequenceFlow id=\"flow4\" sourceRef=\"sendApprovalMail\" targetRef=\"theEnd1\"></sequenceFlow>\n    <endEvent id=\"theEnd1\"></endEvent>\n    <sequenceFlow id=\"flow5\" sourceRef=\"requestApprovedDecision\" targetRef=\"adjustVacationRequestTask\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${vacationApproved == \'false\'}]]></conditionExpression>\n    </sequenceFlow>\n    <userTask id=\"adjustVacationRequestTask\" name=\"Adjust vacation request\" activiti:assignee=\"${employeeName}\">\n      <documentation>Your manager has disapproved your vacation request for ${numberOfDays} days.\n        Reason: ${managerMotivation}</documentation>\n      <extensionElements>\n        <activiti:formProperty id=\"numberOfDays\" name=\"Number of days\" type=\"long\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"startDate\" name=\"First day of holiday (dd-MM-yyy)\" type=\"date\" datePattern=\"dd-MM-yyyy hh:mm\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"vacationMotivation\" name=\"Motivation\" type=\"string\"></activiti:formProperty>\n        <activiti:formProperty id=\"resendRequest\" name=\"Resend vacation request to manager?\" type=\"enum\" required=\"true\">\n          <activiti:value id=\"true\" name=\"Yes\"></activiti:value>\n          <activiti:value id=\"false\" name=\"No\"></activiti:value>\n        </activiti:formProperty>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"flow6\" sourceRef=\"adjustVacationRequestTask\" targetRef=\"resendRequestDecision\"></sequenceFlow>\n    <exclusiveGateway id=\"resendRequestDecision\" name=\"Resend request?\"></exclusiveGateway>\n    <sequenceFlow id=\"flow8\" sourceRef=\"resendRequestDecision\" targetRef=\"theEnd2\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${resendRequest == \'false\'}]]></conditionExpression>\n    </sequenceFlow>\n    <endEvent id=\"theEnd2\"></endEvent>\n    <sequenceFlow id=\"flow7\" sourceRef=\"resendRequestDecision\" targetRef=\"handleRequest\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${resendRequest == \'true\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow2\" sourceRef=\"handleRequest\" targetRef=\"requestApprovedDecision\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_vacationRequest\">\n    <bpmndi:BPMNPlane bpmnElement=\"vacationRequest\" id=\"BPMNPlane_vacationRequest\">\n      <bpmndi:BPMNShape bpmnElement=\"request\" id=\"BPMNShape_request\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"0.0\" y=\"178.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"handleRequest\" id=\"BPMNShape_handleRequest\">\n        <omgdc:Bounds height=\"60.0\" width=\"100.0\" x=\"80.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"requestApprovedDecision\" id=\"BPMNShape_requestApprovedDecision\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"230.0\" y=\"114.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sendApprovalMail\" id=\"BPMNShape_sendApprovalMail\">\n        <omgdc:Bounds height=\"60.0\" width=\"100.0\" x=\"320.0\" y=\"0.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"theEnd1\" id=\"BPMNShape_theEnd1\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"475.0\" y=\"15.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"adjustVacationRequestTask\" id=\"BPMNShape_adjustVacationRequestTask\">\n        <omgdc:Bounds height=\"60.0\" width=\"100.0\" x=\"320.0\" y=\"160.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"resendRequestDecision\" id=\"BPMNShape_resendRequestDecision\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"470.0\" y=\"233.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"theEnd2\" id=\"BPMNShape_theEnd2\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"560.0\" y=\"238.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\">\n        <omgdi:waypoint x=\"30.0\" y=\"193.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"80.0\" y=\"193.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"180.0\" y=\"182.51612903225805\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"192.0\" y=\"180.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"192.0\" y=\"134.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"230.0\" y=\"134.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"270.0\" y=\"134.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"282.0\" y=\"134.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"282.0\" y=\"30.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"320.0\" y=\"30.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\">\n        <omgdi:waypoint x=\"420.0\" y=\"30.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"432.0\" y=\"30.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"432.0\" y=\"30.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"475.00215401185983\" y=\"29.24557624540596\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\">\n        <omgdi:waypoint x=\"270.0\" y=\"134.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"282.0\" y=\"134.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"282.0\" y=\"190.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"320.0\" y=\"190.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\">\n        <omgdi:waypoint x=\"420.0\" y=\"190.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"432.0\" y=\"190.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"432.0\" y=\"253.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"470.0\" y=\"253.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow7\" id=\"BPMNEdge_flow7\">\n        <omgdi:waypoint x=\"470.0\" y=\"253.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"127.0\" y=\"253.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"128.5\" y=\"223.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow8\" id=\"BPMNEdge_flow8\">\n        <omgdi:waypoint x=\"509.7647058823529\" y=\"252.76470588235293\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"560.0009919580556\" y=\"252.1666548576422\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('22503',1,'vacationRequest.vacationRequest.png','22501','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0V\0\0\0\0\0‹Ê0\0\0\"GIDATxÚíİp”å½Çñ€hÕZË±¶UÛ©Zvì9ÎØ3c{<ÓdÚ8*zX–İ,$5xA‹á\"Ş&©¹8\Z‹ÚW¼ ôT-`.Ä”Š¢à%‚˜p—1B$$>çù¿î›óòº›½ï¾ïî÷3óŸlvßÍ†—÷y÷—çyöy\n\0 O)¥†´¶¶>»fÍšÃõõõª¶¶–ÊpÕÕÕ©¦¦¦Ou8\"\0p1	UÍÍÍ*ª¾¾>*KÕÑÑ¡^{íµ½:dá¨\0À¥¤§ŠPå˜pÕW[[ÛÂQ	\0€KÉğ¡Æ9¥ƒÕAJ\0\0\\Jæøh¬G%\0\0y¬zìW[×ªÍkR[×/&¬\0\0@¼ÁªkÏ&µõİ¿©÷WÜ¦Ö¿2İ¨Í÷„V\0\0 –`ÕÓİ¥Ú[–«f÷‡)£ş>Cµ®}\\}±wAˆ`\0\0¢«ıû‚ªeåÜ#U¨¤×J³×Gw©­oV\0\0¬¬õQÓİaCU´bŞÁ\n\0\0‚•íÍ=–Õºvj{ëÉÿ¯·ªkU×î$‚\0\0«x‚U¤ú övÁ\n\0\0‚U<ÁjÓêûÔ\'o>vDmY÷´êÜñ.‰`\0\0ÁÊ¬\rËnJ¨·jÃ²™j_çVÁ\n\0\0‚•Ymo?5D}Øpç7>(½Xû»?% ¬VRRòc¯×;yÜ¸qÏêúXW·.¥ë€®6ıØıušlGë\0¸\"XíëÜfô>Å¬d™…Îöõ„\"‚UR|>ßh]µºúBA*–Z©·ĞŠ\0VRíÔuwÄ0üw“êÚİB(\"X%D‡£a:-#L…«fÇs­\0àØ`E¬ÒÍëõóûıŸYCRII‰š={¶jhhPÛ¶mSûöíSbÿşıª½½]­^½ZÕÔÔ¨ñãÇÛÃU7½W\0\0‚•—ÁJ‡ªb„YÕÂ…U0T±èêê2¶—çY–ş™WĞª\0+*o‚•ôTYCUEE…Ñ;•yŞôéÓíáŠ+\0\0ÁŠÊı`%sª¬Ã•••ıÃ}‰’aÂêêjû°àpZ7\0€`E°Êé`¥CUµ§*ÙPe\rW¶«fZ7\0€`E°ÊÙ`%K*XçT%:ü7Ğ° uÎC‚\0\0‚Á*—ƒU­zdây:,Z´ˆ^+\0\0ÁŠrg°òx<§è\0s«şzÂ@ÛÉJéæ„uéUêììLK°’OÚ–bF+\0¤¤w@×…+‚U:Ip‘\0ãõz»tÍÔÇÜÉá¶]¦Æ;óæÍSé$ë\\Y‚Õ4Î\0€T¼á™óLjõ›Ú+‚Ušz¬N°-Ô)×ô»KsçÚÇgÍm\ZÓ\Z¬dQËï³”³\0 eÁÊRËÂõ`¬Vi8ÖÌP¿ÈX¡*÷§zÒº¬Ğnù=¶s6\0\0¤óÍîˆ!B‚Á*]Çš5Ôëê1¿OÕ-½`íAãl\0\0ÈÈ›¬Ü¬<Ï12$§ë$™L®ëŸå¢Äúÿ÷]ÿ¦ëßÇûºşËï÷ÿNëQºşÛ÷µR},\\©ëZ]7èºQ×mºîĞÏ›««F×ºÖÛ>¡ïFß^¬ë%]Ëõ}\r1k‡­ßg‚õõ8\0@~¬”[ƒÕ®]»r2X%øÿØ\'«ëêÔµK×6]›u}¨ë]]oêZ%!HÂP(-–¤ëq]éº_×=ºæèº]>é§·Ÿ¡kŠ®kä\Z|ÂBaLBÙ(	iÖ\"ı^ú5døïZò¾úıè±\0¤.X9$È­•à‘íÜ¬æÌ™£N<ñDÙ—êÌ3ÏT3fÌ`(0ûÇv‡-PuI+++;Ö²\rs¬\0\09¬T&7«÷Ş{ÏTW]u•ñÉ²É“\'ß×ÕÕ¬²{l·Y>X¥ÕĞ0Ûğ©@\0@N«7äR\"ö@åÆ`µyófuÔQGIˆzçwTww·Z¾|¹q?Á*«Çv‹ÌÅŠ´†•`+\0€ÛƒUØ*7+)é¥\Z4hÑSuöÙg«;ï¼Sõöö¬²(\\•¬¼®Éƒ™Xy=|ÅÊë\0@°Ê\n7N^—!ÁŠŠ\nuÖYg«ººš`å\\+\0@°rP=ÿüójÄˆª­­Íø^>ıuÚi§÷¬\\¬F›¡Gz­R=‰]~ßïÿÊ²f[€3\0¬VJÕÑG­F©/^¬*++«ë¯¿^µ¶¶ª©S§ªõë×G¼M°rD;XiéuLÕÒ²õÿó!koU´ap\0\0Á*¯ƒ•Ô< Î?ÿ|c•„¬ââbO‚IÈZ²dIÄÛ+G´ƒaÖå$\'®$TUWW[çUuû|¾áœu\0€`E°ŠcPyCeåu÷ñz½ãÌ‰ìfÏU¢Ã‚ò<[OC€\0@°\"XQù¬Bí¡Ì\Z®dÎ•Lh—OõÅúé?™¨nSZœt&g\0 X¬¨¼\nVfÏ•¬Òn\rF°d+YDTz£ÌaBé”Õehwşüùª´´ô°m\\¹dNg\Z\0 X¬¨¼V¡v1ÌºC‚ÕÌœ*\0 X¬¨¼V–ö1&°Æ¨¤—ŠOÿ\0ÁŠ`E¬ÂÚuÀšº¶`[èúƒæu·Ëµÿä25¬¨\0+‚E°\0€`E¬\0\0 X¬V\0\0¬V+\0\0@°¢V\0\0¬(‚\0\0+‚Á\n\0\0‚ÁŠ\"X\0@°¢V\0\0¬V+\0\0V+‚\0\0 XQ+\0\0ò XÕ××hœSt°:Hk\0À¥Áª©©iW0$Ô8 ÚÛÛÿªƒU­\0\0—«†††K\Z?ß³gOá&{=Uªêêê¶ê\ZCk\0À¥ÁJè7óâÚÚÚµ2%s|¨Œ—ì÷B\0\09¬\0\0\0V\0\0\0+\0\0\0¬\0\0\0V\0\0\0+\0\0\0¬\0\0\0V\0\0\0+\0\0\0‚\0\0\0V\0\0\0+\0\0\0‚\0\0\0Á\n\0\0\0+\0\0\0‚\0\0\0Á\n\0\0\0+\0\0\0‚\0\0\0Á\n\0\0€`\0\0\0‚\0\0\0Á\n\0\0€`\0\0\0‚\0\0\0Á\n\0\0€`\0\0@°\0\0\0Á\n\0\0€`\0\0@°\0\0 X\0\0€`\0\0@°\0\0 X\0\0€`\0\0@°\0\0 X\0\0¬\0\0\0@°\0\0 X\0\0¬\0\0\0V\0\0\0 X\0\0¬\0\0\0V\0\0\0 X\0\0¬\0\0\0V\0\0\0+\0\0\0¬\0\0\0V\0\0\0	J°\0\0H^‘.úJ°\0\0HĞH]]ºjB_‹	V\0\0\0‰‡*3LIUG6ÂÁ\n\0\0äR¨Šv?Á\n\0\0 Œ¢(áÉ|<cs®V\0\0ÀÍ¡*ZhÊhÏÁ\n\0\0¸ÍÈ‚øz¢âİ`\0\0ò*T\'ğ¼ît‡+‚\0\0ÈõP•ªç¬\0\0@Nˆ6Q=Ó?‡`\0\0\\ªR5Œ—¶+‚\0\0p2ûÄóAºJC_ãa^Z&´¬\0\0€ÓCU±%=Zğõõ\0#\\Ez^ÊÃÁ\n\0\0¸!T‰ÒP8Rq„+k¨2k‚åñ”Î¹\"X\0\0§‰vÂ…¤ÂU¸í	³}Êæ\\¬\0\0@Êù|¾Z]&ªŠâKáÂU¬¡Ê®’\Z$X\0€”“€!%Ëëõ^ãÓb\r7ÑÂU¼¡ÊúúIô\\¬\0\0@Ú‚•¥–EéÁŠw8.R¸\Zœ`¨2%5çŠ`\0\02¬ú{°Â¬Dç8…W“UÉş>+\0\0¹`eíÁ\n\r&û©¼pá*™PeWEñş»ùß\0€ “ñºì²ËÌ\0T“ä?O†ÿì=UC÷\'£&‘G\0\0y¬äÖz½ŞâÂÂÂ!¡M“½\\Í@=Vñ,\"jG\0\0pl°²*{ˆé.HÏ«DÂs¬\0\0€#ƒÕ>Ÿot„@.ÌÄÚCiI…pŸ\nŒ\'\\ñ©@\0\0à¸`5PU´p-ÔD[§*ŞÚM¿,`+\0\0CoøÑzŒb]ü3ŞpeGÎ“ı\0\0òä\r?RÏU¼+ªÇ\Z®Ì×gû\0\0äÉ¾ô\\Ù‡åJâ_§*\\¸š`{”\\€™`\0\0ÁÊéáÊ:¡İ\Z’âYü3ÒóRráe‚\0\0+·°J(šPÿ\nöç%»~Á\n\0\0‚UN„«d…fd?\0€¼yÃOU¸JuH#X\0@°r¥d‡ïÒ2üG°\0€`åöpoSÊ\'ª¬\0\0 Xå‚x‡óÒ:üG°\0€`•/áJ.S“ôŠê+\0\0ëoøE¡ĞT4Àã™\nU+\0\0Vn©ç*cÃ+\0\0V¹®²ªV\0\0¬r-\\Õd+T¬\0\0 Xå™S¥\nÒ¼¤û\0\0‚U¾¼áe?\0\0ŞğÙÏ\0\0€7|°Ÿ\0à\rìg\0\0À>û\0\0ğ†Ï~Î¥ÔÖÖÖg×¬Ys¸¾¾^ÕÖÖR®ºº:ÕÔÔô©®\0-\0xÃ‡‹÷³„ªææfU__•¥êèèP¯½öÚ^²ÆĞZ\0€7|¸t?KO¡Ê1áª¯¶¶¶…Öä9†Ü=”@°Êï`%m–PãœÒíù ­Ès%¸{(`•ßÁJ‚9íÇQÁŠöä;†Ü=”@°\"XÅrl}ñù.Õºvú îv£ä¶ÜG»#XH1†Ü=”@°\"XE;¦º»ÚÕû+nSë_™~DÉ}òí` ñRÎ<1¬VÑ©í¼ôPeÖ–ÒîV\0²¬J X¬ÜÙ~[VÎ¬ä1ÚÁ\n@†OÌ%¬Vî\rVï×VEVòí` Ã\'f†V+‚E°¢3C	+‚•{ƒ•İGj¿òí`€¿x91¬V1¶ßWß±ıÊc´;‚\0‚\'f‚Á*ÆöÛÙ¾A½ÿjå7Û®¾O£İ¬\0døÄÌPÁŠ`åîBÛŞzòmWî£Í¬\0dáÄÌPÁŠ`åâ`ÕÛ«>~ı/ßl»ú>yŒvG°á3C	+‚•;ƒ•,‡²iõ}ÿ0’ÇX2…` Óñ2”@°\"X¹+Xõöª]7¨÷–ß1T™%ÛÈ¶ô^¬€˜)¥İ°aÃ¤\'xâµ9sæì½şúë–••)9Y¯®¾úê¾[n¹¥uîÜ¹uıÁŠ¡‚Ü\Z¬¢õRÑ{E°’\nTÏ=÷Ü“wÜqÇÁ)S¦¨|P­Y³Fµ··«(!_ƒÁ zûí·•^êøÃW7ÜpÃ–òòò+V%¬à¶`K/Õ@½W´C‚–PgÍšÕ;}út#4:tHÅêİwßU3gÎ<4iÒ¤ÇsV^+†yb5jÔñcÇéóùfé7ûUò†¯Ñchñ+³\rUfÑ	V€½—jÈ‹/¾ØpÕUW©¥K—Æ¨ì–/_®&NœØ“Ë½W%8ûÄ&HuëjÖu‡®‹t¨:VO°¢V@ÚBUccã›×]wÚ´i“J…-[¶(Òz®¸âŠkó%X1”½Z¶l™\"H¬V+À¤§JB•Ì™J%ùyåååİúÍ.ÁŠ¡„ìÔşıûUii©\"H¬V+ ëdN•ÿ¥ª§*\\ÏÕ„	ºt¸\ZëÁŠÊ^­X±‚3ÁŠöK°²K>ıwûí·÷Éœªtzå•WzJJJŞ XQœ˜	Vé¤ÿ€«Õu!í—ödÅ’%K–Oÿ}ùå—*İ®¹æšİ¹4$È‰™3œ¬äõ¤$`y½Şh¿´_ £½U²N•,©	ë×¯ïË¥^+NÌœ˜áÜ`e©eáz°h¿´_ ådEu™°Ì²\nñš8qân}¢æäıÂP\'fäT°êïÁ²¶kÚ/íH9¹LÍ#<¢2©¦¦æ]}’›æô7†81#·‚•µKÚ5í—ö¤œ\\ûO.S“I¯¿şú}b[ê†`ÅP\'fd$èd¥h¿ÎªDşi]p¹ ò®]»2\Z¬vïŞÔ\rb»ßJ XÁÕAn­×ë-.,,’lûİ¸q£\Z4h:ùä“UwwwÄíªªªä˜T_|ñ…ª««3nËB¶‰¾îÂ…åÖYi_é~m®õ‰œPVVÖAåL‘×Ó\râ€ËÿÂf(`÷´ß#U*ş0ºùæ›ÕQGe¥§Ÿ~:¦`µ}ûv%S/¶nİšĞk¶´´?K~F¦ÛV&^›`…œ9eƒS‡J X!§‚Õ>Ÿo´=P%¬äÃŸüä\'Òƒ­Î<óL5bÄˆ#ôÑGÕÏşsuÎ9ç¨ßÿş÷ıÁjõêÕê§?ı©Z¹rå·å9•••ê¿ø…q{ß¾}êòË/W?úÑŒŸ?mÚ4ã~ıï0~Ö÷¿ÿ}õä“Oñš—]v™*..îÿ>¨¢¢\"ãö”)SÔé§Ÿnô®]zé¥ª³³Ó¸ÿá‡VÃ†\r3~^II‰úüóÏ#n?Ğk¬\0‹ÒÒÒ¯2İcÕÓÓ³ÛÅ=VI\r%üãÿ0NNşóŸûï“ªÜ—è_±ı…,\'o¹½dÉÇ„Ÿt\'¬j¿a{¨R¬äø•võÒK/©Ûn»Íüè£ŒÇ¤WJ¾—ĞõÔSOá$ÜP }XpòäÉê;ßùq[z…=öXÕÔÔ¤,X .ºè\"cèñ03qâDõşûïñ;İÿıÆcò{ìØ±C\r2DÍ™3G½õÖ[êì³ÏVO<ñ„|pÈØæ¹çSŸ~ú©úÖ·¾eüÒãvüñÇ«?şñ·èµ	V€Åu×]×—é9V;wîÜèÂ9V)JÈ÷`•îá‚â‘h°òx<êÛßş¶Zµj•zæ™gŒcúÆo4{è¡‡Œï7oŞl|?~üø¸ƒÕÚµkp&½Cò|³Wk öÓÑÑa„#9ŸÜ{ï½êè£6–ù¼»îºKıö·¿5?ş|#8Ém¹Œ™l³gÏ#Ú©}{†é¿¶>Îô§W¬Xñw}*0¥C	±«pİğò<6¿@åë~ğõØcÅ4ô`\rVÕÕÕÆsO=õTã¯Sûïçöá‚Ò¬äQéé‘ãØZ§œrŠq!p	!òı¶mÛŒíËËËÃ«úúzãöË/¿llwå•Wö+)¹_Ú“´W³×(Z¸™0a‚qøõ¯­.¹ä’şŞ5é½’¶,ç	yş}÷İ×ßÃ%=a²¬®®®ˆÛ¬€é¿JÉô:V:H¼â‚u¬Ò2”`«O<Ñ8aJpÂ	ıÁ*R7¼	Èí_ıêWÆIùÜsÏU§vZÔ¡k°’§Ü¾å–[Œ¿hÍ¡Œ\\\ZN X!İÁÊl;‹-RëÖ­3jÖ¬YÆ}‹/VmmmÆm¹¨}CCƒÑNÃ«?üĞ¸=sæLãögœÑ¬|ğAuŞyçíP‚L’ÿÓŸş¤>ùä“şç„ëánll4—óÁ/¼`ÜwÓM7½WrxüñÇÇï¹ç£}<Øø=åy\'t’ºöÚk#noíÖÖV5uêT¹šFÄÛ+ä¥[o½õÌÉ“\'ÎàÊëü~ÿ\'N_y=]\'f3X=Úè=’’ùÖ«pİğf°’ù²Í5×\\cšhCÖ`5wî\\ãD*?[Â:ù9¹4œ@°Bºƒ•	AövsÜqÇ©‹/¾Øø^‚Ö÷¾÷=5tèPs­¥#‚ÕòåË	ğfï²„¯1cÆô+iG2!^æYI;•í¤7IzÄäyÎìÙ³Ãş~Ã‡7z¤{zzŒïß{ï=c¼´ıßüæ7ê‡?ü¡¦ä1	k?ûÙÏŒv.½É;wîŒ¸½ıµ­ç–H·	VÈ[›3u­À+V,Ô¡9_OÌÑ†#uÃ›ÁêÅ_4#Í–“¡ÜhèÁz’ÓÿÏÆÏ–çÎ˜1Ã(™HKÃ	+¤;XÅZ2$.aÄü^>ég¶—×_½ÿ~	Q½½½aÆŞ½{çYï“À$(ŞßÇúG½>ûì³˜¶Oôµ	VÈ;—_~¹gêÔ©3ĞkÕå÷û×ù|¾\0Á*|°ŠÔ\ro+sèÎ\Z¬\Zz°+~Ûtä÷¸à‚$èæÔpÁ\nN	Vö’?&äØ—áÿ`0Èò(+äºI“&mXºtiZS•Ìç’Şªhó–ò9XEê†(X\r4ô`\rVò×³,+=IÇsŒ\Z5j”±M.\r\'¬àÔ`µeË£\'·½½E°B>9O\'Nì‘¡œtØ°aÃ‹ú5vù|¾áœ˜“ë¶uè!RÉĞB¸®ÿ\\N XÁ©ÁŠ\"X!’I“&í—nêTÚ±cÇ*¿ß¿5—†\091³ò:h¿Á\nˆª¤¤dbyyywªz®¤§JB•×ëÉ‰™\"XöK¬wt\Zö¾ğÂ_$1¡½ëî»ï^ ÃºÊ81S+Ğ~)‚ò–Ì¹òûıõ“&MÚ½nİºxÖ©zõÕWé`¶V&ªçÚœ*NÌ+Ğ~)‚LÀ\Z#«¬¬,8gÎœV­Zµµ½½}—yáf¹ ²\\û¯®®îåªªªe%%%­¨¤—*—>ıÇ‰™`Ú/E°RF¦û|¾)ú@~VW›®¡kéÉ×írí?¹LM®¬¨Î‰™`Ú/E°À‰™3@û%XàÄL¬@û¥ı¬\0NÌœ	V ıR+\0œ˜	V ıÒnV\081S+Ğ~	V´w€3E°í—\"XàÄL°í—\"XàÄÌ‰ ı¬\0pb¦VH£úúzÚsê€n¿	V\0ÁŠ\"Á\n.ÕÔÔ´+ÒvPíííÕí·…`¬8)¬àR\r\r\r—466~¾gÏÚOözª$TÕÕÕmÕ5†`ä9†Ü=”\0è7ób}Ü¬•cG‚9•ñ’ıŞo¨\"X9Š¡w%\0p/‚ƒra(¡··7o‡\0¬\08Œ›‡,X ü~¿zõÕWór(\0Á\n\0R¢°°pˆ>1mÒõ%{\0Á\n\0’àóù¦È‰Iª¤¤äÇì\0+\0H,Tìõz»Ì`¥«Š½€`\0‰î³„*©í24È@°€8øışóô	é€-XI]ÅŞ@°€øNFÍaB•òz½ï°w\0¬\0 öQY¸Pe	Wç²—\0¬\0 \nÇs‚>µE	V³§\0¬\0 Š±cÇÔ\'¢¥ºVêj‘åóùÛÂÕA–^\0@°r”¡üoî91=ëõz=¡Ş¬a2±]ß>…=€`åEºTè+\0œ˜ê¤\'‹=€`å8rnîÒUúZÌÿ:àüÓÛ~¿ÿ|ö\0‚•#C•¦¤Çªƒp8ÿÄÔªƒÕì	\0+Ç†ªh÷p\n¹¬VÿÄ\0@°r„¢(áÉ|œ9W1cé÷¹É2ŸX×ÇººCÔ’E²ÛôcKô×i|h)QUU5XP‡ä+{\0ÁÊ1¡*Zh¢ç*\nŸÏ7ZW­®¾–²ÕJ½}€½‡„IO•>>cO\0 XeİÈ‚øz¢âİ>_‰a:-#L…«fÇs{‰«3ôô	{\0ÁÊ¡ª8çu®¾æõzÇé÷µÏ¬!©¤¤DÍ=[544¨mÛ¶©}ûö)±ÿ~ÕŞŞ®V¯^­jjjÔøñãíáª›Ş+$¬Î×Ï[ì	\0+×…ªT=?WBU±B‡¬jáÂ…*ªXtuuÛËó¬KÿÌ+hiˆ™¬_%cĞì	\0«¬ˆ6Q=Ó?Ç­¡jœ5TUTT½S‰çMŸ>İ®è¹BÌ£G0cO\0 Xe-T¥j//{®BWéş«¬¬ìîK”VWWÛ‡‡ÓâËY®ëAö\0‚UFÙ\'ÒU\Zú\ZûóònB»UuÖªdC•5\\Ùz®šiqˆÊëõÎÔËö\0‚UÆCU±%=Zğõõ\0#\\Ez^Ş„+YRÁ:§*Ñá¿†­s®D,Áj®>XndO\0 Xe%T‰ÒP8Rq„+k¨2k‚åñ¼˜s%s„ÍĞ#ÏÓaÑ¢EôZ!®“ÒC2È\0@°J»Ha\'\\H\Z(\\…Ûş‘0Û»rÎ•Çã9Eÿ¿Şª¿0Ğv²Rº9a]z•:;;Ó¬äÓ‚¶¥†Ñò0ĞIéY™ÀÎ\0@°Š­‡D×…I„ª¢8ÂR¸pk¨²‡«\"ıŸ“ÿW¹ÜšLWÑûûäpÛ….Sc„yóæ©t’u®,Áj\Z-Àu²ä{\0Á*¶×Íµ©ÕoìÄø´XÃM´po¨²¾~GKz®¤§Ê¶P§\\Óï.½¿Ïµw˜Û466¦5XÉ\"¢–ßg)-$Ş–EBÙ\0V±+K-‹Òƒïp\\¤p58ÁPerÕœ«H—šÑûz‘°BT6îOõ¤u;Y¡İò{l§åa ƒ·U.kÃ\0@°Jê\r?Üa¢sœÂ…«I„ªdÇ+k ÕÕc~Ÿª%ZzÁÚƒFËCD2†-bfO\0 X¥æ\r?4D˜lQ¸p•L¨²‡«¢òòò£G\Zu¼Çãù®Ìc\n§ê÷ƒÓåâÃúßp¾ï_eDCş=úßõŸúûúûßé¯£ô}—éû¼²ü€¾ı?¡5¯ÕßOÑ5Cßw‹ş¾JWµş~ş¾Fß¾_ÖMÔµ@ß·Pı_]ÏËĞš~\\.š\\¯«I×1ìçÃÖï3Áúz´<„UUU58É«SEQJŸfk’<MÓSµ1t2jB¿ã—ºöëú\\W‡®º¶††Ø>Ôµ^®%\n:xê%\0ézIß~N×_u=¥CÒc¡Àt¿(	Rºféï+uİ¬ï›.K‚—0	bºJô}cõ÷—Ê5şBm„¸P‹´_7éÇ¯¾øâ‹O”ÕĞé±‚\rb\0@Ò=Vk% 	mšìåjê±ŠgÑˆ=VßÏÖı+£+r1ä²²²c-Û0Ç\n\0€Vö@e1İé™c•H¸rÓ«6Ë\'«t \Z\Zf>\0@«7är*U¸0kQ¤%Â}*0på¶O¶„†O´\rëX\0àş`5PU´p-ÔD[§*ŞÚM¿,pÑ:V\"\\•¬¼®ÿ?fbåõ@ ğ+¯\0àÑzŒb]ü3ŞpeGÎÅÊµ\0È_‘z®â]Q=Öpe¾Şè\\İ¡2k†éµJõ$vùy~¿ÿ+Ëzec\0\0œCz®ìÃr¥ñ¯S.\\M°½ë.ÀœxVšÁ§¢¢\"eK/ÈS§N=dí­Šs\0\0d(\\Y\'´[CR<‹Fzë.¼œd°\Zf]¡²²2ép%¡ªººÚ:¯ªÛçó\rçĞ\0À™ìÃ‚Š&Ä¿„‚ıyÉ®ŸåJ^¯wœ9‘İì¹JtXPgë©b\0\0†«d…fÌ:\0•YÃ•Ì¹’	íò©¾X?ı\'Õ­sªB‹“ÎäP\0 ¿Â•kÿL\'é¹’UÚ­ÁH–¬s%‹ˆJo”9L(Ã}²¢º,ş9ş|UZZzØ¶ø«\\2§ŒC\0\0wIvø./‡ÿ\"‘9WÖe¬fæT\0àşpoS^MT3`	¬ƒñ*é¥âÓ\0\0¸_¼ÃyÿÅ@Vh×kJèÚ‚m¡ëš×!Ü.×ş“ËÔ°¢:\0\0ù®ä259»¢:\0\0@ª…BSÑ\0wª\0\0\0b©çŠá?\0\0€„+B\0\0@\nÂU\r¡\n\0\0 y2§J°¤\0\0@Je\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¹íÿ\0Ë£ÅA”îE<\0\0\0\0IEND®B`‚',1),('2502',1,'X:\\source\\LIFT\\51-Demo\\newFlow\\com.yss.sofa.simpleflow\\target\\classes\\processes\\basic.bpmn20.xml','2501','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<!--\r\n* Copyright 2012-2014 the original author or authors.\r\n*\r\n* Licensed under the Apache License, Version 2.0 (the \"License\");\r\n* you may not use this file except in compliance with the License.\r\n* You may obtain a copy of the License at\r\n*\r\n*      http://www.apache.org/licenses/LICENSE-2.0\r\n*\r\n* Unless required by applicable law or agreed to in writing, software\r\n* distributed under the License is distributed on an \"AS IS\" BASIS,\r\n* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.\r\n* See the License for the specific language governing permissions and\r\n* limitations under the License.\r\n-->\r\n<definitions id=\"processDefinitions\"\r\n             xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\"\r\n             xmlns:activiti=\"http://activiti.org/bpmn\"\r\n             targetNamespace=\"processDefinitions\">\r\n\r\n    <process id=\"waiter\">\r\n\r\n        <startEvent id=\"start\"/>\r\n\r\n        <sequenceFlow id=\"flow1\" sourceRef=\"start\" targetRef=\"service1\"/>\r\n\r\n        <scriptTask id=\"service1\" scriptFormat=\"groovy\">\r\n            <script>\r\n               println \'customerId=\' + customerId\r\n            </script>\r\n        </scriptTask>\r\n\r\n        <sequenceFlow id=\"flow2\" sourceRef=\"service1\" targetRef=\"end\"/>\r\n\r\n        <endEvent id=\"end\"/>\r\n\r\n    </process>\r\n\r\n</definitions>',0),('2503',1,'X:\\source\\LIFT\\51-Demo\\newFlow\\com.yss.sofa.simpleflow\\target\\classes\\processes\\basic2.bpmn','2501','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<!--\r\n* Copyright 2012-2014 the original author or authors.\r\n*\r\n* Licensed under the Apache License, Version 2.0 (the \"License\");\r\n* you may not use this file except in compliance with the License.\r\n* You may obtain a copy of the License at\r\n*\r\n*      http://www.apache.org/licenses/LICENSE-2.0\r\n*\r\n* Unless required by applicable law or agreed to in writing, software\r\n* distributed under the License is distributed on an \"AS IS\" BASIS,\r\n* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.\r\n* See the License for the specific language governing permissions and\r\n* limitations under the License.\r\n-->\r\n<definitions id=\"processDefinitions\"\r\n             xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\"\r\n             xmlns:activiti=\"http://activiti.org/bpmn\"\r\n             targetNamespace=\"processDefinitions\">\r\n\r\n    <process id=\"waiter2\">\r\n\r\n        <startEvent id=\"start\"/>\r\n\r\n        <sequenceFlow id=\"flow1\" sourceRef=\"start\" targetRef=\"service1\"/>\r\n\r\n        <scriptTask id=\"service1\" scriptFormat=\"groovy\">\r\n            <script>\r\n               println \'customerId=\' + customerId\r\n            </script>\r\n        </scriptTask>\r\n\r\n        <sequenceFlow id=\"flow2\" sourceRef=\"service1\" targetRef=\"end\"/>\r\n\r\n        <endEvent id=\"end\"/>\r\n\r\n    </process>\r\n\r\n</definitions>',0),('27502',1,'X:\\source\\LIFT\\51-Demo\\newFlow\\com.yss.sofa.simpleflow\\target\\classes\\processes\\basic.bpmn20.xml','27501','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<!--\r\n* Copyright 2012-2014 the original author or authors.\r\n*\r\n* Licensed under the Apache License, Version 2.0 (the \"License\");\r\n* you may not use this file except in compliance with the License.\r\n* You may obtain a copy of the License at\r\n*\r\n*      http://www.apache.org/licenses/LICENSE-2.0\r\n*\r\n* Unless required by applicable law or agreed to in writing, software\r\n* distributed under the License is distributed on an \"AS IS\" BASIS,\r\n* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.\r\n* See the License for the specific language governing permissions and\r\n* limitations under the License.\r\n-->\r\n<definitions id=\"processDefinitions\"\r\n             xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\"\r\n             xmlns:activiti=\"http://activiti.org/bpmn\"\r\n             targetNamespace=\"processDefinitions\">\r\n\r\n    <process id=\"waiter\">\r\n\r\n        <startEvent id=\"start\"/>\r\n\r\n        <sequenceFlow id=\"flow1\" sourceRef=\"start\" targetRef=\"service1\"/>\r\n\r\n        <scriptTask id=\"service1\" scriptFormat=\"groovy\">\r\n            <script>\r\n               println \'customerId=\' + customerId\r\n            </script>\r\n        </scriptTask>\r\n\r\n        <sequenceFlow id=\"flow2\" sourceRef=\"service1\" targetRef=\"end\"/>\r\n\r\n        <endEvent id=\"end\"/>\r\n\r\n    </process>\r\n\r\n</definitions>',0),('27503',1,'X:\\source\\LIFT\\51-Demo\\newFlow\\com.yss.sofa.simpleflow\\target\\classes\\processes\\basic2.bpmn','27501','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<!--\r\n* Copyright 2012-2014 the original author or authors.\r\n*\r\n* Licensed under the Apache License, Version 2.0 (the \"License\");\r\n* you may not use this file except in compliance with the License.\r\n* You may obtain a copy of the License at\r\n*\r\n*      http://www.apache.org/licenses/LICENSE-2.0\r\n*\r\n* Unless required by applicable law or agreed to in writing, software\r\n* distributed under the License is distributed on an \"AS IS\" BASIS,\r\n* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.\r\n* See the License for the specific language governing permissions and\r\n* limitations under the License.\r\n-->\r\n<definitions id=\"processDefinitions\"\r\n             xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\"\r\n             xmlns:activiti=\"http://activiti.org/bpmn\"\r\n             targetNamespace=\"processDefinitions\">\r\n\r\n    <process id=\"waiter2\">\r\n\r\n        <startEvent id=\"start\"/>\r\n\r\n        <sequenceFlow id=\"flow1\" sourceRef=\"start\" targetRef=\"service1\"/>\r\n\r\n        <scriptTask id=\"service1\" scriptFormat=\"groovy\">\r\n            <script>\r\n               println \'customerId=\' + customerId\r\n            </script>\r\n        </scriptTask>\r\n\r\n        <sequenceFlow id=\"flow2\" sourceRef=\"service1\" targetRef=\"end\"/>\r\n\r\n        <endEvent id=\"end\"/>\r\n\r\n    </process>\r\n\r\n</definitions>',0),('3',1,'D:\\openSource\\Learn.demo\\activity\\target\\classes\\processes\\basic.bpmn20.xml','1','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<!--\r\n* Copyright 2012-2014 the original author or authors.\r\n*\r\n* Licensed under the Apache License, Version 2.0 (the \"License\");\r\n* you may not use this file except in compliance with the License.\r\n* You may obtain a copy of the License at\r\n*\r\n*      http://www.apache.org/licenses/LICENSE-2.0\r\n*\r\n* Unless required by applicable law or agreed to in writing, software\r\n* distributed under the License is distributed on an \"AS IS\" BASIS,\r\n* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.\r\n* See the License for the specific language governing permissions and\r\n* limitations under the License.\r\n-->\r\n<definitions id=\"processDefinitions\"\r\n             xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\"\r\n             xmlns:activiti=\"http://activiti.org/bpmn\"\r\n             targetNamespace=\"processDefinitions\">\r\n\r\n    <process id=\"waiter\">\r\n\r\n        <startEvent id=\"start\"/>\r\n\r\n        <sequenceFlow id=\"flow1\" sourceRef=\"start\" targetRef=\"service1\"/>\r\n\r\n        <scriptTask id=\"service1\" scriptFormat=\"groovy\">\r\n            <script>\r\n               println \'customerId=\' + customerId\r\n            </script>\r\n        </scriptTask>\r\n\r\n        <sequenceFlow id=\"flow2\" sourceRef=\"service1\" targetRef=\"end\"/>\r\n\r\n        <endEvent id=\"end\"/>\r\n\r\n    </process>\r\n\r\n</definitions>',0),('5002',1,'basic.bpmn20.xml','5001','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<!--\r\n* Copyright 2012-2014 the original author or authors.\r\n*\r\n* Licensed under the Apache License, Version 2.0 (the \"License\");\r\n* you may not use this file except in compliance with the License.\r\n* You may obtain a copy of the License at\r\n*\r\n*      http://www.apache.org/licenses/LICENSE-2.0\r\n*\r\n* Unless required by applicable law or agreed to in writing, software\r\n* distributed under the License is distributed on an \"AS IS\" BASIS,\r\n* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.\r\n* See the License for the specific language governing permissions and\r\n* limitations under the License.\r\n-->\r\n<definitions id=\"processDefinitions\"\r\n             xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\"\r\n             xmlns:activiti=\"http://activiti.org/bpmn\"\r\n             targetNamespace=\"processDefinitions\">\r\n\r\n    <process id=\"waiter\">\r\n\r\n        <startEvent id=\"start\"/>\r\n\r\n        <sequenceFlow id=\"flow1\" sourceRef=\"start\" targetRef=\"service1\"/>\r\n\r\n        <scriptTask id=\"service1\" scriptFormat=\"groovy\">\r\n            <script>\r\n               println \'customerId=\' + customerId\r\n            </script>\r\n        </scriptTask>\r\n\r\n        <sequenceFlow id=\"flow2\" sourceRef=\"service1\" targetRef=\"end\"/>\r\n\r\n        <endEvent id=\"end\"/>\r\n\r\n    </process>\r\n\r\n</definitions>',0),('7502',1,'test.bpmn20.xml','7501','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://activiti.org/bpmn20\" id=\"definitions\">\n  <process id=\"vacationRequest\" name=\"Vacation request\" isExecutable=\"true\">\n    <startEvent id=\"request\" activiti:initiator=\"employeeName\">\n      <extensionElements>\n        <activiti:formProperty id=\"numberOfDays\" name=\"Number of days\" type=\"long\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"startDate\" name=\"First day of holiday (dd-MM-yyy)\" type=\"date\" datePattern=\"dd-MM-yyyy hh:mm\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"vacationMotivation\" name=\"Motivation\" type=\"string\"></activiti:formProperty>\n      </extensionElements>\n    </startEvent>\n    <sequenceFlow id=\"flow1\" sourceRef=\"request\" targetRef=\"handleRequest\"></sequenceFlow>\n    <userTask id=\"handleRequest\" name=\"Handle vacation request\" activiti:candidateGroups=\"management\">\n      <documentation>${employeeName} would like to take ${numberOfDays} day(s) of vacation (Motivation: ${vacationMotivation}).</documentation>\n      <extensionElements>\n        <activiti:formProperty id=\"vacationApproved\" name=\"Do you approve this vacation\" type=\"enum\" required=\"true\">\n          <activiti:value id=\"true\" name=\"Approve\"></activiti:value>\n          <activiti:value id=\"false\" name=\"Reject\"></activiti:value>\n        </activiti:formProperty>\n        <activiti:formProperty id=\"managerMotivation\" name=\"Motivation\" type=\"string\"></activiti:formProperty>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"flow2\" sourceRef=\"handleRequest\" targetRef=\"requestApprovedDecision\"></sequenceFlow>\n    <exclusiveGateway id=\"requestApprovedDecision\" name=\"Request approved?\"></exclusiveGateway>\n    <sequenceFlow id=\"flow3\" sourceRef=\"requestApprovedDecision\" targetRef=\"sendApprovalMail\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${vacationApproved == \'true\'}]]></conditionExpression>\n    </sequenceFlow>\n    <manualTask id=\"sendApprovalMail\" name=\"Send confirmation e-mail\"></manualTask>\n    <sequenceFlow id=\"flow4\" sourceRef=\"sendApprovalMail\" targetRef=\"theEnd1\"></sequenceFlow>\n    <endEvent id=\"theEnd1\"></endEvent>\n    <sequenceFlow id=\"flow5\" sourceRef=\"requestApprovedDecision\" targetRef=\"adjustVacationRequestTask\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${vacationApproved == \'false\'}]]></conditionExpression>\n    </sequenceFlow>\n    <userTask id=\"adjustVacationRequestTask\" name=\"Adjust vacation request\" activiti:assignee=\"${employeeName}\">\n      <documentation>Your manager has disapproved your vacation request for ${numberOfDays} days.\n        Reason: ${managerMotivation}</documentation>\n      <extensionElements>\n        <activiti:formProperty id=\"numberOfDays\" name=\"Number of days\" type=\"long\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"startDate\" name=\"First day of holiday (dd-MM-yyy)\" type=\"date\" datePattern=\"dd-MM-yyyy hh:mm\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"vacationMotivation\" name=\"Motivation\" type=\"string\"></activiti:formProperty>\n        <activiti:formProperty id=\"resendRequest\" name=\"Resend vacation request to manager?\" type=\"enum\" required=\"true\">\n          <activiti:value id=\"true\" name=\"Yes\"></activiti:value>\n          <activiti:value id=\"false\" name=\"No\"></activiti:value>\n        </activiti:formProperty>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"flow6\" sourceRef=\"adjustVacationRequestTask\" targetRef=\"resendRequestDecision\"></sequenceFlow>\n    <exclusiveGateway id=\"resendRequestDecision\" name=\"Resend request?\"></exclusiveGateway>\n    <sequenceFlow id=\"flow7\" sourceRef=\"resendRequestDecision\" targetRef=\"handleRequest\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${resendRequest == \'true\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow8\" sourceRef=\"resendRequestDecision\" targetRef=\"theEnd2\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${resendRequest == \'false\'}]]></conditionExpression>\n    </sequenceFlow>\n    <endEvent id=\"theEnd2\"></endEvent>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_vacationRequest\">\n    <bpmndi:BPMNPlane bpmnElement=\"vacationRequest\" id=\"BPMNPlane_vacationRequest\">\n      <bpmndi:BPMNShape bpmnElement=\"request\" id=\"BPMNShape_request\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"0.0\" y=\"178.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"handleRequest\" id=\"BPMNShape_handleRequest\">\n        <omgdc:Bounds height=\"60.0\" width=\"100.0\" x=\"80.0\" y=\"163.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"requestApprovedDecision\" id=\"BPMNShape_requestApprovedDecision\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"230.0\" y=\"114.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sendApprovalMail\" id=\"BPMNShape_sendApprovalMail\">\n        <omgdc:Bounds height=\"60.0\" width=\"100.0\" x=\"320.0\" y=\"0.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"theEnd1\" id=\"BPMNShape_theEnd1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"475.0\" y=\"15.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"adjustVacationRequestTask\" id=\"BPMNShape_adjustVacationRequestTask\">\n        <omgdc:Bounds height=\"60.0\" width=\"100.0\" x=\"320.0\" y=\"160.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"resendRequestDecision\" id=\"BPMNShape_resendRequestDecision\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"470.0\" y=\"233.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"theEnd2\" id=\"BPMNShape_theEnd2\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"560.0\" y=\"238.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\">\n        <omgdi:waypoint x=\"35.0\" y=\"195.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"80.0\" y=\"193.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"180.0\" y=\"193.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"192.0\" y=\"180.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"192.0\" y=\"134.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"230.0\" y=\"134.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"270.0\" y=\"134.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"282.0\" y=\"134.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"282.0\" y=\"30.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"320.0\" y=\"30.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\">\n        <omgdi:waypoint x=\"420.0\" y=\"30.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"432.0\" y=\"30.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"432.0\" y=\"30.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"475.0\" y=\"32.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\">\n        <omgdi:waypoint x=\"270.0\" y=\"134.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"282.0\" y=\"134.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"282.0\" y=\"190.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"320.0\" y=\"190.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\">\n        <omgdi:waypoint x=\"420.0\" y=\"190.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"432.0\" y=\"190.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"432.0\" y=\"253.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"470.0\" y=\"253.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow7\" id=\"BPMNEdge_flow7\">\n        <omgdi:waypoint x=\"470.0\" y=\"253.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"458.0\" y=\"253.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"239.0\" y=\"253.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"127.0\" y=\"253.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"130.0\" y=\"223.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow8\" id=\"BPMNEdge_flow8\">\n        <omgdi:waypoint x=\"510.0\" y=\"253.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"560.0\" y=\"255.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('7503',1,'test.vacationRequest.png','7501','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0]\0\0\0\0\0àk1Ç\0\0#IDATxÚíİpÕ}Çq…G	…4¦%™„†¤êfhJóhè2jÊ§5…$–.÷Ê›ÄVa—\"l\Zkì±QM°[Ó1h0¡ê¨\".2 ù©¸VıŠcpü ¶±…,[B(È(²e‘ÓÿsW]­ïku_»÷~?3ÿ¹O=¼Ú³şİsÎ-+€eŒ¹èÈ‘#\ríííï¬_¿Ş´´´Py®ÖÖV³eË–7¤&³G\0P¤4pµµµ™îînsöìYª@ÕÓÓc6oŞü–°Iì•\0\0!íá\"pù&xmiiÙÏ^	\0@Ò!EJB×9öJ\0\0ŠÎ)\"ìø*töJ\0\0J<t0=Çv˜_¶?jıü¿I„.\0\0ÍĞÕwê9¶çGæ•ëÌÏŸ¯µê`ÛÃ„$B\0\0È4tıútŸéÜÿ‚ùÅ†Å#AËªæûÌ‘O˜·ß:EH\"t\0€LB×@·Ù¿ñ;£ÃV¬´·K_s×MKLÏ±í\'B\0\0H7tØò/qWªb¡\0\0x]é¬#;V™£;ŸüÿÚµÚœ8ØbúN$<º\0\0@¶BW¢Ú×²ğDè\0\0Ù\n]‡¶.7‡·?>ª^Ûı”é}}á‰Ğ\0\0Ò	]{×İ?¦^®½ëæšşŞc„\'B\0\0H\'tİõ)Ö/6üóyg0jï×Àé7O„®Œ…Ãá+C¡Ğb‰ÔF©)ã¨.©mòÇä½Óåşµl5\0@àBWïq«×*Ğ¥KEôvşœÀDèÊŠÊÊÊ[$H=+!jĞ²RÕ9\raRÑòòò‹hÙ\0€@„.­ŞÎ½f_ë¢4†ï7}\'÷˜]‘°ôI©ƒV¢Ú¯½_´n\0@ BEèÊ	H‹c=U#Á©ªªÊ,^¼Ø444˜}ûö™®®.388hÔĞĞéîî6‡2Öû¦L™/|­“ïóAZ9\0€ĞE•tèª¨¨¸<6_k$(E£Q³zõj+Ty100`šššÌìÙ³G¯P(Ô\'·å´t\0\0¡‹*ÉĞ\\mÎ€TWWgõhebxxØ477[=eï}Zj­\0@è¢J.t¹{¸tQS¶tvvšÚÚZgğ\Z…Biñ\0\0BU2¡+6‡k$µ··›\\Ğ9`:ßËÙã%?{<­\0@è¢Š>tÅÎR<çìáÊ%t___?j}/]Œ–\0 tºŠ:t…B¡Ÿ9çpesH1‘şş~3cÆçäúe´|\0\0¡‹ĞU´¡K>u¥˜é¤y/víÚåX-­\0áp¸Eê3„.B—_HĞYk]\"ß–.]ê^K8J\0\0²õœõŸ‹†¯P(t#¡‹Ğ•+Éö/Ç‡€+íKûèr^×áÊ†Ã‡Z¿+\ZãH\0ÈZèr®Î¯ç‹ĞEèÊÂ¾¶1vñé‰I‚Ùö¾¨gŠsñTiwp¤\0\0ä\"tô|9Ã¡‹Ğ•…}íUÇ>¶*Ş|)ÎË×‹É¬Y³†	õ\0€ü„.gÏ—ººŞåƒ}í¨kß:§kqéªó®Ş0ëõ,téš`Î )\0 4CPAŠĞå¯\Zãßñm©“R¿”Ú#õS	Ô/Èí%XüPî¯ú<®“ú©áßº­²²ò¯åµOI@ú¨ÔJı¾ÔïxÜ·{ü^úü½åååÉm‡ı|>ÏZt;~üø¨5»82@‘†.Ÿ„¼:÷Fÿ#Ô÷º‚ßÓ5eÊ”Ë$@]%×?’ús	R7E\"‘[å¹/KM“¿ù]r{ŸÜ.”úW©G¥–÷şDß ÷·KıBê¸Ô›Rg¥†b÷Ç^Û®ï}Í3rû˜ÏÉó‹Ò…{œu¥øBÑÅR¿G&\0 tå\"t\n[¶ …®íÛ·››o¾Ù\\rÉ%æÒK/57İt“Ùºu+sºr ººúb	nWÈ~sì7ª½aÚ+¦½cÚE¦½e±^³yi„®³ÎÇ…Fè\0BW®B×6=KË¶‚º®»î:İ†fïŞ½f÷îİÖık®¹†ĞU@UUUL´NkOXEEÅ»?ĞÓ\0(¶Ğ·g+È¡K{·4héDl†}³__ë\n[]²ßÍr¯Åœ.\0@Ñ†®t)t=ôĞCVèºì²ËLMMÕãEè*,	X×ÛgÊí$	[ïN°ÿsö\"\0€Ğ¤P¢s¸ôº}\Z¼4€i#t¶§+éå}Ëı°N—şlGO×rL\0@è\"t¥¨+té¤zB—ÿ…ÃáÉ~X‘¾¶¶Öº&qd\0B¡+N?Ş\nZzãÎ;­û:¹^_ÓûZÉîº\n\'6á~äÚ‹ııı…Ï5¨×ƒäÈ\0„.BWœÚ³gÏÈ’^x¡µdÄ¶mÛ]Ái#óº\ZóºV®\\é]«8*\0¡‹ĞÅâ¨EÉ9Ä¨\'BäséˆÎÎN«‡Íşù‘HäJ\0@è\"tºŠRìr@/ÛÁ§©©)o¡káÂ…Î]?Ë	\0]„.BWQ/ØéìíÒ§×^{-ç«¹¹yÔÅ¸u™H\0@è\"tºL	´…µvºç{ÌÀÀ@Î—.1âV”šÉÑ\0]„.ª$BWEEÅÕÒzì T__o]\'K×tcò<\0º]TI†.¥ªJõÙHç\\õööfuHÑÕÃµNÂŞå‰\0€ĞEè¢J*t)½»½v—–öJéez2=Kqşüùî‹o¸\0€ĞEè¢J7t©ÊÊÊ[¤mœv†$]±ŞëõuáS]‡ËÕ»e\r)¸\0€ĞEè¢J>tÅz¼ÆKûèp…%s÷İw›gyÆ´µµYg9Úó¾ôVC–öŠéµçÌ™ãZÖYŠLš\0B¡‹\"t¹ho”„¯Åî^¯±”®ÃÅ²\0@è\"tQ„®$b×h\\äœdŸféÜ°U¬4\0 tQ„.¢Ñè»có½–èDø8Ã]áp¸En—K@»“‹W\0]¡\0\0B¡‹Ğ\0\0¡‹ĞEè\0\0„.ŠĞ\0\0¡‹ĞEè\0€Ğå\'ë×¯\'ìø§%t£µ\0\0P„¡kË–-]İİİTggçJèÚOk\0 C×†\rnß´iÓ¯N:õk‚Oáz¸4pµ¶¶“šDk\0 C—’ÿè\'¶´´ìĞ¡-SDå½t»ï\'p\0Pä¡\0\0€Ğ\0\0\0B\0\0\0¡\0\0€Ğ\0\0\0B\0\0\0¡\0\0\0„.\0\0\0B\0\0\0¡\0\0\0„.\0\0\0B\0\0\0]\0\0\0„.\0\0\0B\0\0\0]\0\0\0„.\0\0\0B\0\0\0]\0\0\0„.\0\0\0º\0\0\0]\0\0\0„.\0\0\0º\0\0\0]\0\0\0„.B\0\0\0¡\0\0€Ğ\0\0\0B\0\0\0¡\0\0€Ğ\0\0\0B\0\0\0¡\0\0\0„.\0\0\0B\0\0\0¡\0\0\0„.\0\0\0B\0\0\0¡\0\0\0„.\0\0\0B\0\0\0]\0\0\0„.\0\0\0B\0\0\0]\0\0\0„.\0\0\0º\0\0\0]\0\0\0„.\0\0\0º\0\0\0]\0\0\0„.\0\0€\"7Ğ\0\0[¤Lì–Ğ\0\0·HõI-‹İN$t\0\0ä&pÙAK{ºz\n¼]\0\0 TWªç	]\0\0\0MH¬ì×ó6Ç‹Ğ\0\0Š5p¥\nTyíñ\"t\0€brK™·,¯ï\'t\0\0WÙØz®ôëNç:xº\0\0@)®l}=¡\0\0½T“æóı}]\0\0 hW¶†sÖãEè\0\0Aåÿ.©i±[/Ü_—“Éõ„.\0\0äÀ5Ñœ~PöÛë+şÀCğJôuY^„.\0\0ôÀ¥¦Å‚“ñ¼œË®©×³:Ç‹Ğ\0\0‚$QŠ ’¯xïÿ÷8ïÏÚ/B\0\0È«p8Ü\"õ™×A*^ğJ7p¹ƒWFC„.\0\0W\Z>´4|…B¡Óü²tƒOªàå5p9~OY=^„.\0\0PĞå¨u)z¾¼ñ%\n^Œ1pÙ2šãEè\0\0…]#=_qÂ×XçTÅ^3\\™ş>„.\0\0àĞåìùŠ\r;fzö`¼à•Iàr¯	^ÿİüõ\0 ùª¾ô¥/ÙáhY†ÿ<Rt÷pŒ=Ÿ‰ecùw±·\0Pâ¡Ë\'!oG(šX^^~Qì­™^â\'YO——Tİèé\0\0]î°å8§Ër3§k,Á‹9]\0\0 p¡k[8¾#AØŠtÒíYJ´,D¼³½/Î^\0\0\n]Éz¶R¯T\'Õ:\\^W®·}²Œuº\0\0@BWRõ4¥»ğ©×àeqŞQ\"Û\0\0”xè²Pº×^L¶,DºÁËşyw”Øv\0\0%º”öx¹‡ú¦•y_‡+^ğšêú9Y¹Ø5¡\0\05¸—“p(/Ÿ&úº¬\\äšĞ\0\0Š!¸‡\Z50M-ó¾„ûë2]ŒĞ\0\0Š.Œyİ¬â\r]²\0\0a ‹Á+ÛĞ\0\0Š.d:$˜“!EB\0\0(Æ00Ö³\r³>iĞ\0\0Š=x\"Ìé\"¡\0\0sH7Hé¥}2^iĞ\0\0J9Lˆª	I^ïÉWà\"t\0€b‰z¼ò6¤Hè\0\0¥Ü« ‹Ğ\0\0J!ØAkY¡¡\0\0”JĞ9\\¦,ÇËB°\0\0a ¬lÛ\0\0ØÎ\0\0€0\0¶3\0\0 °\0\0a\0lg\0\0@(ñílŒ¹èÈ‘#\ríííï¬_¿Ş´´´Py®ÖÖV³eË–7¤&ÓR\0€0€\"İÎ\Z¸ÚÚÚLww·9{ö,U êéé1›7o~KØ$Z\0P„ÛY{¸\\¾	^g[ZZöÓZ\0$ÄğD°‡\']¥º´ÍxüSÒÏÑZ\0$ÄğD°‡\']¥º4´Ó~|ºh\0cx\"ØÃ„.BW:ûÖÛ¿ê2Gv¬2ûZZ¥÷õ9Ú¡@1<ìá	B¡+Õ>uº¯Ó¼òbùùóµ£JŸÓ×hw„.\0>û¤Lùó Mè\"t¥Ú§:öıä¼Àe×ëûÖÒî]\0üº tº‚Ù~÷oüNÂĞ¥¯Ñî]\0|tĞfx‚ĞEè\nnèz¥eAÂĞ¥¯Ñî]\0|tĞfx‚ĞEè\"tQ„.\0y8h3<Aè\"t7tét€DíW_£İº\0ğI™ƒ6¡‹Ğ•…öûêÖG¶_}vGè@èâ Mè\"te¡ıövî5¯¼4ÿü¶+Ïék´;B\0´ tº‚½8êÑO×võ9Ú¡€ÏÚOº]]gÎ˜WÿgåùmWÓ×hw„.\0>:h3<Aè\"t3té’.‡¶.Oø¡I_cÙB\0?}Rfx‚ĞEè\nVè:sÆt½ºÁ¼üÂ?%\\vé{ô½ôzº€¬Z°`Á¸+V<°hÑ¢uuu=555CUUUF¨ZÕÕÕÃ÷İw_ßÂ…÷|÷»ßış¼yóşˆĞÅğ¡A\n]©z·èõ\"t9U__ëüùó6yòäßHØ2MMMfïŞ½¦»»Û[oo¯9pà€yá…ÌÒ¥K¾_BX‡|MuyyùE¥º t!X¡+Ş­d½^´CB0&³gÏ¾öşûïß3}úôß444X¡Ê‹¡¡!³uëV3oŞ¼ßÔÔÔœœ1cÆß—LèbxÂ—íÛn»íw+++o	‡ÃHø©†ŠŠŠß¡µºì\Zkà²‹vHè<«««›õµ¯}íÜøC300`2µcÇ#¡khæÌ™MòŸÜåÅºğÏA;NÈ:-Õ&µHêod_¼”ÖNè¢]@ÁÌ;÷ûwİu×ğ®]»L6õ÷÷›+VE£ÑòŸİÕÅ\Zº(\\­[·Î²]„.B˜À5kÖ¬wt¾V®<ıôÓïL<ù-ùğ‹1t1<Q˜ÒÙiÓ¦B¡‹ĞEè|O‡µ‡+—ËöÜsÏ‘àÕô/Úşª_|‘ƒ6¡‹öKèüM\'Íë®={ö˜|yê©§ND\"‘ŸùÌFÚ´á¿Ğ‡[¤>Cû¥ı¾4wîÜ—uÒ|¾}ë[ß:\n…fº(Ú„®lş<-\r_r|¹‘öKû|C×áÒe!²q–¢WÃ‘HäM98^Iè¢8hº²ºµ.^Ïí—öä.|ÚØØh\nåÁÜ\'ÄÅ„.Šƒ6¡+G¡k¤çË¾h¿´_ ¯ôÒ>ºr¼×…O³ÜÛÕ-Â7ü2·K\'÷Ëz^:ë‰qĞæ à„.gÏ—;Ò~i¿@^­\\¹r±^Ú§Ğ¾ñoLgâkØ×êYÊ}Rs“\r}rĞæ ¬„ ‚í×_5–¿!­¢¯^»vmÁC×Ã?¼Õ/CŒÚÃåjØƒRK$€]Oè\"t!Ğ!o‡´ã‰v¯:í—k§yUWW×£¯.´ööö=Ò€6úı -Áğgøâ MèB B×¨°•iûıØÇ>¦û™UGMø>û=îûc­Í›7›Ï~ö³i[ùøÙ„.½ššš¡|,†šÊÉ“\'»¤uh8„9!„.ø?tm“Jw$š/:–ö»sçÎ‘\0¥õ½ï}/­Ğ•Êö÷óÛÏ&t¡èUUU™ááaãÚ€ª««/2eÊe‘Hä\n9X^%¿ßåşGäşx¹ÿgrÿrÿ¯*++?«×Ø“Ç+áçv©\n©*©¯È÷©Öµ¿¤î‘ûs¤êb—…yPê_¥‘ú¾Ô*©§äûıHn›¤š¥Zåñæ4B×;RÃ„.B|ºâöle#t}ó›ß´ÂG4\Zµnå84òÚÌ\r7Ü`.½ôRóÕ¯~5aO—;À8?÷Üsæúë¯7_|±õ}´wéğáÃæ’K.öœ¿ÓÓO?m=7yòdëñÔ©S­Ç«W¯¶z¨>úÑZßïª«®2O<ñ„õcÇÙ>ÖóãÇ7Û¶méÑr¿?ÙÏ&twZ¿ˆ…™!©·¥Ş”:%Õ!uXj¿D÷ÊíN©ÿÑ`[øğy\rL\Zœ¤VÇ‚”ªåòø_bAk¡`ÿ u—3©¨T$Ø4¸}Aƒœº$aë|ßšŠŠŠ÷j@ôzĞNv°Íö§ÑB~*.Ô¡^xm¿ƒƒƒæ}ï{Ÿyÿûß¯½óVûÒ`¤Ïëë\Zbô¹gŸ}Ö\nOc	]ï}ï{G†-·oßnİÿÔ§>•´MŸ8qÂzşCúõøÃş°õ¸££Ã\nPú}ô¾>§ß_ßó…/|Áz¬aKouÈTŸOô~zº€\"ìéòQíq†-=“QÂÖtùtûîLÚ¥ºüöI„./û×ückÿ3gõøãÿ¸õØş>v†0­±„®›nºÉº¯=M\ZŒV¬XazzzR¶íÓ×6nÜhİjxÒç5¼éï«ÁÍùõöïêş>‰ŞOè²À/sºä rÂgsº:Î\\\\ ak\\6ÚÉ¶‰†ì÷Ü{ï½æ²Ë.³>i?úè£†3ô ­Cz Õ÷~ùË_6¯¿şzÑ\rQºËĞuÛm·Ú‡í²CX6B—~ş^:ŒyÍ5×XÏ_wİu)ƒË­×n¿ıvëöë_ÿºõ¼¶K}¬g©§º½ŸĞdÁ·¿ıí7öíÛç—³Û|ºt8sYªË5t¹+n}²xå•W¬ûW\\q…§á{şÉîİ»^Ô\\ïßzë­E7DAèB®B—\'^xá…æ‹_üâÈs?ş¸µ?ë}¬mÊn\r\r\r	Û£~pÒûÚŸşùQ¯}úÓŸiSv›üÀ>`½¦ºôñ[o½52¤i—ıóôƒŞ®Y³fT¸Ò¶ïü9vÛİºuë¨¶›èıîŸn $tºNWss³/ÖéÒµ°ü²]õlå²§+İn}½¯/Ÿ¬İ½LZú\\±\rQº«Ğµ|ùrkßÕÅ¤çí}Z{}uÂ»†\r>Ó§O?oß·Û­öüêíu={ö¨÷é÷Ñ`§¯é÷Ñ6¤=ÇvÈÓ\\ú}´ÚùûiÒçíŸcIêğ¤¶SwO¸¶Q\rxú3´İë‡¤dïwÿlB0ÒÀ–Ö××<tÍš5ëi@åÅ><‘,t¥Û­/ô¤ºÜŸ‹mˆ‚Ğ…\\¶ß±ÖÀÀ€µßë|Î2&t¡„ÕÖÖ^=mÚ´ßèA¡€ktéµßvOR/µĞ•¨[?Ù×¤;œ‰D¬û:Ìşş7ß|óy¿_Ğ‡(]ğcèúÜç>gŞó÷Œ´\'ŠĞ…6gÎœ_nÚ´©`¡ë‘GÙ\n…+…ƒv²\0•¨[?Ù×¤\ZÎ°ïë|×¥Cú34¬é0†û÷ú¡~]¡1wîÜğ½÷ŞûN!–8‰DŞÔEP9hS/‚öKû%t¡èÕÔÔœlkkË{èZ´h‘.xºœƒ6Eèí—öKèBI¨®®şüŒ3†úúúò¸vïŞıj8şeEEÅå´)Bh¿´_BJÆÌ™3ÿëá‡>—aÆ\'Nè°¢^v‡ƒ6Eèí—\"t¡¤èÅa¿ò•¯}òÉ\'‡r¸º»»‡£Ñè‰p8<›ƒ6Eèí—\"t¡$é\nìS¦Lémll<›«®XàZÌA›\"töKºPÒôLÂÉ“\'w>şøã\'³=‡K‡‹¡‡‹ƒ6¡´_ŠĞd­ÇKÒOô¬ÆcÇÉtY=KQ\'Í}mBh¿¡È‰P(4KÂ×©xàåÃ‡ŸôºÒüŠ+vhï–4•A>K‘ƒ6¡„.ŠĞäœ†%Ù¹HuTWW|è¡‡¶mÜ¸q÷ñãÇ9CVooï©ööö=zñj½–¢^ÚGWšêÂ§´	] tQ„. =_7ÆØ:©£RçtÇU—Ô6©%zñê ^K‘ƒ6¡„.ŠĞ€ƒ6Eèí—öKè8hS„.Ğ~)B\0Ú´Ú/¡\0mŠĞ…ü[¿~=íÆ?5(í÷¡\0¡‹Ğ…\"´eË–®îînÚª³³ó?¥ıî\'t tºP„6lØpû¦M›~uêÔ©_Ó~\n×Ã¥«µµõ˜Ô$B€„öğ ÿÑO”ıf‡î;\ZÚ©¼—n÷ı^¡(AO{x@pº€SÃgÎœ)Ùá	\0„.\0äá‰U«V™H$b^zé¥’\0@è€œ+//¿HZ‡¤†Ø\Z\0]\0#ápx¶}İÌb¾(9\0B\02p]\n…ú+_ÀV@è€ì¬–;—V‡7²e\0º\0 K\"‘È\rr°\Zt….­™l\0„.\0ÈŞª-Nà2¡Pègl\0„.\0ÈÎA*\Z/p9‚×õl%\0„.\0È@EEÅår:š\"t=Æ–@è€TVVŞ\"©µR¥ök\0‡Ãï¸‚×9–\0@èò•qüµâ8h5„B¡ŠX/Øµ:É^î_Í–@èò…	R&v à­VícK\0 tù›û¤–Ån\'òW‚}ĞÚ‰D>Á–\0@èòeà²ƒ–ötõ¼€`´Hèú[\0¡Ë·+Õó\0‚@/$¡ë\n¶\0B—/LH¬ì×™ãåAìÒw²ËÜ¹$v2Y‡ë$².©mz¿¼wºÎqf«!«,XpìXÃzËÖ\0@èòMàJ¨èñJ“ÎY– õl‚«°$«s\ZÂtmK.‘‡¬Ğ.Ù¡ŞdK\0 tÜ-eŞz°¼¾¿ÔöOJíğ´Õ~íıb«\"ÓĞõÙ™³%\0º|¸&áëN¼F“€´8ÖS5œªªªÌâÅ‹MCCƒÙ·oŸéêê2ƒƒƒF\r\r\r™îînsèĞ!ÓØØh½oÊ”)ñÂ×:Ö±D&¡ë²ídK\0 t.peëë‹Fl½ÉÎ FÍêÕ«­PåÅÀÀ€ijj2³gÏv_µ¥OnËi}ğLÇºåA[\0¡« RMšÏ÷÷	zàjs¤ºº:«G+ÃÃÃ¦¹¹Ùê)s|ïÓR“hğDW¢—Ğõ#¶\0BWÁW¶†KºÇËİÃ¥Ãˆ\Z˜²¥³³ÓÔÖÖ:ƒ× üÊ‰ğ´“VK}Ÿ-€Ğ•WîIğï’š»õÂıu%9¹>6‡k$µ··›\\Ğ9`:ßËÙã%?{<-i‘”>WvšÙ\0]y\\Áée¿½¾â<¯D_WRÁ+v–â9gW.é¤ûúúúQë{é\Z`´F¤º¾#;Ì¶\0BWA—šNÆCğr.»¦:^/™9^òÿØÏœs¸²9¤˜H¿™1c†srı2Z#Ò9`=ªCŒl	\0„®œK„â¨dÁ+Şûÿ=Îû‹~—æ<K1ÓIó^ìÚµË=±şZZ$R°\Zt2=[\0¡+5=Û[ê3®	‚T¼à•nàr¯	Eú÷_k]\"ß–.]ê^Kh‘HµÃ¶ê\'¶\0BWz?OKÃ—|`½1Í/K7ø¤\n^^—óç÷”¨Ç+\ZK#\0_i_ÚG—sğºW6>|xÔú]éüŞ(íÖ.] •-€Ğ•~èr®P¢çËë_¢àuÁ—-Ps¼ô²;Ús”,ÄÄ.^mıôŒÂBq.*ûÂ´J$Û±è¥€Ø\0]c\n]#=_qÂ×XçTÅ^3\\™ş>…ø»u¬ş>O>ó%ù:c1™5kÖ0¡éÑZ/zÍ–\0@è\Z{èrö|Å†3íYŠ¼2	\\îà5Áç×8—Ş‰–——_äxÏÈb¨(XèÒ5Áœá›V‰¸,XpA–®¾NQE¹J³™öz\\§‡ë`ìùL,‹}¯q>]‰¶ë~	6bïé°ŸÏçY‹nÇµfé©>M\02;ô’0˜L/ñ“¬§ËËªçõtÅ~ßa©_K½%õ††©ãR‡%ÔÛ—¥vKı¯ÔOc½J/Iı·ü;ŸÕËÇÉı§¤ÇÉíw¥şMî/­¿PªNà–Çÿ(÷¿)÷¿!÷§KM“Ç‘Øeèîû\'÷?_YYù×:D+?F¨İå|¬+ÅŠ.–ê\nÛ\0\0 ¡Ë¶F©Óe¹™Ó5–à52§KßŠŠŠK«ªª~oêÔ© ÷¯–Ë5:ÇWîÿ‰ü›®—Ç!ÿRƒ\"\rF\Z4(i`Òà¤Jƒ”*\rV\Z°bW:©Óà¥Lƒ˜2\rf±€ö„6\rn\Zà4ÈI½(7Ä.XİFè\Zv>.4B\0\0¹]Û4|$[ñ‚Nº=^‰–…ˆwö¢—à´³…­©r÷{èé\0 øBW²­”=Lc\\ÉÖéJ\'x}²,@ëté™Š® 5¨gjï›ëoÁœ.\0\0pT=Mé.|ê5xÙCœY?J/§c_ZGÃV¢‹Isö\"\0\0(K€Ò½öb²e!Ò\r^öÏÔ‚±ùeR­î.ïYî‡uºôg;zº–³›\0àÚãåê›Væ}®xÁkªëçõÅ®Ãáğd?¬H_[[ë]“ØÅ\0ğWğrN®w(/Ÿ&úº¢¾Èµ­ªªêƒÎk/ö÷÷z>×`¢¡P\0\0P8î¡F\rLSË¼/áşºL×ç¼®ÆÆÆ¼‡®•+W:C×*vk\0\0‚¼2oè²¨9‡kjjòºtDgg§ÕÃfÿüH$r»4\0\0Å¼s1ëlÒ¥;b«ç[Á§©©)o¡káÂ…ÎkC>Ë®\0€ÿe:$XRCŠnÎŞ.íyzíµ×r¸š››ÃŠçÜkˆ\0\0ÿ/¯=U%1i>	>kítÏ=÷˜œ®­[·\ZV”šÉî\0@°x\",É!Åxbk{õØA¨¾¾Şº<O.W4\Zeò<\0\0%¼ôÒ>Zi>×B¡ĞR}v Ò9W½½½YRtõp­ÓK±å\0®	±@5!Éë=®óéEÈíµ»´´WJ/Ó“éYŠóçÏw_x›À\0@‘HÔãÅb\n•••·èu!IW¬÷z}F]øT×árõnYCŠ.\0\0Š;x¸Ò‡ÇK8êp…%s÷İw›gyÆ´µµYg9Úó¾ôVC–öŠéµçÌ™ãZÖYŠLš\0 øƒ×2—7Ú%ák±»×k,¥ëp±,\0\0ÅOçp™²_b¬b×h\\äœdŸféÜ°U¬4\0@iÇ&ÈL4\Z}wl¾×gø±+·Èír	hwrñj\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 şR†ÑÛŸ<÷*\0\0\0\0IEND®B`‚',1);

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

insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('47501','comment','2019-06-06 07:25:38.421',NULL,'45008',NULL,'AddComment','dddddd','dddddd'),('50001','comment','2019-06-06 07:36:09.227',NULL,'47504',NULL,'AddComment','æ²¡æœ‰æ„è§ï¼Œå¥½å¥½æ´»ç€ï¼','æ²¡æœ‰æ„è§ï¼Œå¥½å¥½æ´»ç€ï¼'),('52501','comment','2019-06-10 02:48:42.861',NULL,'50004',NULL,'AddComment','æ²¡æœ‰æ„è§ï¼Œå¥½å¥½æ´»ç€ï¼','æ²¡æœ‰æ„è§ï¼Œå¥½å¥½æ´»ç€ï¼'),('52508','comment','2019-06-10 03:03:02.699',NULL,'52505',NULL,'AddComment','æ²¡æœ‰æ„è§ï¼Œå¥½å¥½æ´»ç€ï¼','æ²¡æœ‰æ„è§ï¼Œå¥½å¥½æ´»ç€ï¼'),('55031','comment','2019-06-11 02:11:56.612',NULL,'52511','22505','AddComment','æ²¡æœ‰æ„è§ï¼Œå¥½å¥½æ´»ç€','æ²¡æœ‰æ„è§ï¼Œå¥½å¥½æ´»ç€');

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

insert  into `act_hi_detail`(`ID_`,`TYPE_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`ACT_INST_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`TIME_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('55032','FormProperty','22505','22505','52511','52510','fname',NULL,NULL,'2019-06-11 02:11:56.620',NULL,NULL,NULL,'å¼ ä¸‰è¯·å‡å•',NULL),('55033','FormProperty','22505','22505','52511','52510','vacationMotivation',NULL,NULL,'2019-06-11 02:11:56.684',NULL,NULL,NULL,'',NULL),('55034','FormProperty','22505','22505','52511','52510','fbegindate',NULL,NULL,'2019-06-11 02:11:56.684',NULL,NULL,NULL,'2019-06-05',NULL),('55035','FormProperty','22505','22505','52511','52510','fapplyuser',NULL,NULL,'2019-06-11 02:11:56.684',NULL,NULL,NULL,'å¼ ä¸‰',NULL),('55036','FormProperty','22505','22505','52511','52510','numberOfDays',NULL,NULL,'2019-06-11 02:11:56.684',NULL,NULL,NULL,'',NULL),('55037','FormProperty','22505','22505','52511','52510','message',NULL,NULL,'2019-06-11 02:11:56.684',NULL,NULL,NULL,'æ²¡æœ‰æ„è§ï¼Œå¥½å¥½æ´»ç€',NULL),('55038','FormProperty','22505','22505','52511','52510','fenddate',NULL,NULL,'2019-06-11 02:11:56.684',NULL,NULL,NULL,'2019-06-10',NULL),('55039','FormProperty','22505','22505','52511','52510','fapplyreason',NULL,NULL,'2019-06-11 02:11:56.684',NULL,NULL,NULL,'ç”Ÿç—…è¯·å‡å‡ å¤©',NULL),('55040','FormProperty','22505','22505','52511','52510','fapplytype',NULL,NULL,'2019-06-11 02:11:56.684',NULL,NULL,NULL,'äº‹å‡',NULL),('55041','FormProperty','22505','22505','52511','52510','processInstaceId',NULL,NULL,'2019-06-11 02:11:56.684',NULL,NULL,NULL,'22505',NULL),('55042','FormProperty','22505','22505','52511','52510','resendRequest',NULL,NULL,'2019-06-11 02:11:56.684',NULL,NULL,NULL,'true',NULL),('55043','FormProperty','22505','22505','52511','52510','startDate',NULL,NULL,'2019-06-11 02:11:56.684',NULL,NULL,NULL,'',NULL),('55044','FormProperty','22505','22505','52511','52510','fcode',NULL,NULL,'2019-06-11 02:11:56.684',NULL,NULL,NULL,'001',NULL);

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

insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('12503','7505','7505',NULL,'vacationApproved','boolean',0,NULL,NULL,1,NULL,NULL,'2019-06-03 02:50:59.001','2019-06-03 02:50:59.055'),('12504','7505','7505',NULL,'managerMotivation','string',0,NULL,NULL,NULL,'lsp test',NULL,'2019-06-03 02:50:59.002','2019-06-03 02:50:59.055'),('12505','7505','7505',NULL,'doubleTaskVar','double',0,NULL,99.99,NULL,NULL,NULL,'2019-06-03 02:50:59.002','2019-06-03 02:50:59.055'),('12510','12509','12509',NULL,'employeeName','null',1,NULL,NULL,NULL,NULL,NULL,'2019-06-03 03:03:25.070','2019-06-03 03:07:23.960'),('12512','12509','12509',NULL,'name','string',1,NULL,NULL,NULL,'lsp',NULL,'2019-06-03 03:03:25.070','2019-06-03 03:07:23.960'),('12513','12509','12509',NULL,'age','string',1,NULL,NULL,NULL,'30',NULL,'2019-06-03 03:03:25.070','2019-06-03 03:07:23.960'),('12517','12509','12509',NULL,'vacationApproved','boolean',0,NULL,NULL,1,NULL,NULL,'2019-06-03 03:07:23.902','2019-06-03 03:07:23.960'),('12518','12509','12509',NULL,'managerMotivation','string',0,NULL,NULL,NULL,'lsp test',NULL,'2019-06-03 03:07:23.902','2019-06-03 03:07:23.960'),('12519','12509','12509',NULL,'doubleTaskVar','double',0,NULL,99.99,NULL,NULL,NULL,'2019-06-03 03:07:23.903','2019-06-03 03:07:23.960'),('12524','12523','12523',NULL,'employeeName','null',1,NULL,NULL,NULL,NULL,NULL,'2019-06-03 03:08:38.690','2019-06-03 03:09:16.011'),('12526','12523','12523',NULL,'name','string',1,NULL,NULL,NULL,'lsp',NULL,'2019-06-03 03:08:38.690','2019-06-03 03:09:16.011'),('12527','12523','12523',NULL,'age','string',1,NULL,NULL,NULL,'30',NULL,'2019-06-03 03:08:38.690','2019-06-03 03:09:16.011'),('12531','12523','12523',NULL,'vacationApproved','boolean',0,NULL,NULL,1,NULL,NULL,'2019-06-03 03:09:16.002','2019-06-03 03:09:16.011'),('12532','12523','12523',NULL,'managerMotivation','string',0,NULL,NULL,NULL,'lsp test',NULL,'2019-06-03 03:09:16.002','2019-06-03 03:09:16.011'),('12533','12523','12523',NULL,'doubleTaskVar','double',0,NULL,99.99,NULL,NULL,NULL,'2019-06-03 03:09:16.002','2019-06-03 03:09:16.011'),('12538','12537','12537',NULL,'employeeName','null',0,NULL,NULL,NULL,NULL,NULL,'2019-06-03 03:11:32.361','2019-06-03 03:11:32.361'),('12540','12537','12537',NULL,'name','string',0,NULL,NULL,NULL,'lsp',NULL,'2019-06-03 03:11:32.362','2019-06-03 03:11:32.362'),('12541','12537','12537',NULL,'age','string',0,NULL,NULL,NULL,'30',NULL,'2019-06-03 03:11:32.362','2019-06-03 03:11:32.362'),('12549','12537','12537',NULL,'vacationApproved','string',3,NULL,NULL,NULL,'false',NULL,'2019-06-03 03:13:22.701','2019-06-03 04:31:05.971'),('12550','12537','12537',NULL,'managerMotivation','string',3,NULL,NULL,NULL,'true',NULL,'2019-06-03 03:13:22.701','2019-06-03 04:31:05.972'),('12551','12537','12537',NULL,'doubleTaskVar','double',0,NULL,99.99,NULL,NULL,NULL,'2019-06-03 03:13:22.701','2019-06-03 03:13:22.701'),('12555','12537','12537',NULL,'vacationMotivation','string',3,NULL,NULL,NULL,'lsp test',NULL,'2019-06-03 03:26:29.542','2019-06-03 04:31:05.969'),('12556','12537','12537',NULL,'numberOfDays','string',3,NULL,NULL,NULL,'11',NULL,'2019-06-03 03:26:29.543','2019-06-03 04:31:05.973'),('12557','12537','12537',NULL,'resendRequest','string',3,NULL,NULL,NULL,'true',NULL,'2019-06-03 03:26:29.543','2019-06-03 04:31:05.974'),('12558','12537','12537',NULL,'startDate','string',3,NULL,NULL,NULL,'2019-08-08 11:25',NULL,'2019-06-03 03:26:29.543','2019-06-03 04:31:05.976'),('17501','12537','12537','15003','vacationMotivation','string',0,NULL,NULL,NULL,'lsp test',NULL,'2019-06-03 04:29:09.531','2019-06-03 04:29:09.531'),('17502','12537','12537','15003','vacationApproved','string',0,NULL,NULL,NULL,'false',NULL,'2019-06-03 04:29:09.531','2019-06-03 04:29:09.531'),('17503','12537','12537','15003','managerMotivation','string',0,NULL,NULL,NULL,'true',NULL,'2019-06-03 04:29:09.531','2019-06-03 04:29:09.531'),('17504','12537','12537','15003','numberOfDays','string',0,NULL,NULL,NULL,'11',NULL,'2019-06-03 04:29:09.531','2019-06-03 04:29:09.531'),('17505','12537','12537','15003','resendRequest','string',0,NULL,NULL,NULL,'true',NULL,'2019-06-03 04:29:09.531','2019-06-03 04:29:09.531'),('17506','12537','12537','15003','startDate','string',0,NULL,NULL,NULL,'2019-08-08 11:25',NULL,'2019-06-03 04:29:09.531','2019-06-03 04:29:09.531'),('17522','17521','17521',NULL,'employeeName','null',1,NULL,NULL,NULL,NULL,NULL,'2019-06-03 04:34:31.213','2019-06-03 04:40:24.051'),('17524','17521','17521',NULL,'name','string',1,NULL,NULL,NULL,'lsp',NULL,'2019-06-03 04:34:31.213','2019-06-03 04:40:24.051'),('17525','17521','17521',NULL,'age','string',1,NULL,NULL,NULL,'30',NULL,'2019-06-03 04:34:31.213','2019-06-03 04:40:24.051'),('17561','17521','17521',NULL,'vacationApproved','string',0,NULL,NULL,NULL,'true',NULL,'2019-06-03 04:40:24.032','2019-06-03 04:40:24.051'),('17562','17521','17521',NULL,'managerMotivation','string',0,NULL,NULL,NULL,'true',NULL,'2019-06-03 04:40:24.032','2019-06-03 04:40:24.051'),('17567','17566','17566',NULL,'employeeName','string',1,NULL,NULL,NULL,'lsp',NULL,'2019-06-03 04:54:59.687','2019-06-03 05:38:11.233'),('17569','17566','17566',NULL,'name','string',0,NULL,NULL,NULL,'lsp',NULL,'2019-06-03 04:54:59.687','2019-06-03 04:54:59.687'),('17570','17566','17566',NULL,'age','string',0,NULL,NULL,NULL,'30',NULL,'2019-06-03 04:54:59.687','2019-06-03 04:54:59.687'),('17577','17566','17566',NULL,'vacationApproved','string',1,NULL,NULL,NULL,'false',NULL,'2019-06-03 04:57:32.781','2019-06-03 05:38:11.233'),('17578','17566','17566',NULL,'managerMotivation','string',1,NULL,NULL,NULL,'true',NULL,'2019-06-03 04:57:32.781','2019-06-03 05:38:11.234'),('17583','17582','17582',NULL,'employeeName','null',0,NULL,NULL,NULL,NULL,NULL,'2019-06-03 04:59:26.810','2019-06-03 04:59:26.810'),('17585','17582','17582',NULL,'name','string',0,NULL,NULL,NULL,'lsp',NULL,'2019-06-03 04:59:26.810','2019-06-03 04:59:26.810'),('17586','17582','17582',NULL,'age','string',0,NULL,NULL,NULL,'30',NULL,'2019-06-03 04:59:26.810','2019-06-03 04:59:26.810'),('17590','17566','17566','17581','myTaskVariable','string',0,NULL,NULL,NULL,'Hello my friend',NULL,'2019-06-03 05:01:43.131','2019-06-03 05:01:43.131'),('17591','17582','17582',NULL,'name1','string',0,NULL,NULL,NULL,'lsp',NULL,'2019-06-03 05:08:21.856','2019-06-03 05:08:21.856'),('17592','17582','17582','17588','name_lsp','string',1,NULL,NULL,NULL,'name_lsp',NULL,'2019-06-03 05:08:44.555','2019-06-03 05:28:31.621'),('17593','17582','17582','17588','name','string',0,NULL,NULL,NULL,'lsp1',NULL,'2019-06-03 05:24:41.027','2019-06-03 05:24:41.027'),('17599','12537','12537',NULL,'employeeName','string',1,NULL,NULL,NULL,'lsp',NULL,'2019-06-03 05:34:08.651','2019-06-06 01:32:42.798'),('17600','12537','12537',NULL,'vacationApproved','string',1,NULL,NULL,NULL,'false',NULL,'2019-06-03 05:34:08.651','2019-06-06 01:32:42.800'),('17601','12537','12537',NULL,'managerMotivation','string',1,NULL,NULL,NULL,'true',NULL,'2019-06-03 05:34:08.651','2019-06-06 01:32:42.801'),('17625','17566','17566',NULL,'resendRequest','string',0,NULL,NULL,NULL,'true',NULL,'2019-06-03 05:38:11.234','2019-06-03 05:38:11.234'),('22506','22505','22505',NULL,'employeeName','string',19,NULL,NULL,NULL,'shengpengliu',NULL,'2019-06-03 14:33:30.107','2019-06-10 03:03:02.774'),('22508','22505','22505',NULL,'myVar','string',0,NULL,NULL,NULL,'This is a variable',NULL,'2019-06-03 14:33:30.108','2019-06-03 14:33:30.108'),('30001','22505','22505',NULL,'vacationApproved','string',18,NULL,NULL,NULL,'false',NULL,'2019-06-04 05:40:13.825','2019-06-10 03:03:02.774'),('30002','22505','22505',NULL,'managerMotivation','string',18,NULL,NULL,NULL,'true',NULL,'2019-06-04 05:40:13.825','2019-06-10 03:03:02.775'),('30003','22505','22505',NULL,'resendRequest','string',19,NULL,NULL,NULL,'true',NULL,'2019-06-04 05:40:13.825','2019-06-11 02:11:56.698'),('32501','12537','12537',NULL,'resendRequest','string',0,NULL,NULL,NULL,'true',NULL,'2019-06-06 01:32:42.833','2019-06-06 01:32:42.833'),('52502','22505','22505',NULL,'name','string',1,NULL,NULL,NULL,'shengpengliu111',NULL,'2019-06-10 02:48:42.968','2019-06-10 03:03:02.775'),('52512','22505','22505','52511','name','string',0,NULL,NULL,NULL,'lsp1',NULL,'2019-06-10 03:06:11.014','2019-06-10 03:06:11.014'),('55045','22505','22505',NULL,'numberOfDays','null',0,NULL,NULL,NULL,NULL,NULL,'2019-06-11 02:11:56.691','2019-06-11 02:11:56.691'),('55046','22505','22505',NULL,'startDate','null',0,NULL,NULL,NULL,NULL,NULL,'2019-06-11 02:11:56.693','2019-06-11 02:11:56.693'),('55047','22505','22505',NULL,'vacationMotivation','string',0,NULL,NULL,NULL,'',NULL,'2019-06-11 02:11:56.693','2019-06-11 02:11:56.693'),('55048','22505','22505',NULL,'fname','string',0,NULL,NULL,NULL,'å¼ ä¸‰è¯·å‡å•',NULL,'2019-06-11 02:11:56.698','2019-06-11 02:11:56.698'),('55049','22505','22505',NULL,'fbegindate','string',0,NULL,NULL,NULL,'2019-06-05',NULL,'2019-06-11 02:11:56.698','2019-06-11 02:11:56.698'),('55050','22505','22505',NULL,'fapplyuser','string',0,NULL,NULL,NULL,'å¼ ä¸‰',NULL,'2019-06-11 02:11:56.698','2019-06-11 02:11:56.698'),('55051','22505','22505',NULL,'message','string',0,NULL,NULL,NULL,'æ²¡æœ‰æ„è§ï¼Œå¥½å¥½æ´»ç€',NULL,'2019-06-11 02:11:56.698','2019-06-11 02:11:56.698'),('55052','22505','22505',NULL,'fenddate','string',0,NULL,NULL,NULL,'2019-06-10',NULL,'2019-06-11 02:11:56.698','2019-06-11 02:11:56.698'),('55053','22505','22505',NULL,'fapplyreason','string',0,NULL,NULL,NULL,'ç”Ÿç—…è¯·å‡å‡ å¤©',NULL,'2019-06-11 02:11:56.698','2019-06-11 02:11:56.698'),('55054','22505','22505',NULL,'fapplytype','string',0,NULL,NULL,NULL,'äº‹å‡',NULL,'2019-06-11 02:11:56.698','2019-06-11 02:11:56.698'),('55055','22505','22505',NULL,'processInstaceId','string',0,NULL,NULL,NULL,'22505',NULL,'2019-06-11 02:11:56.698','2019-06-11 02:11:56.698'),('55056','22505','22505',NULL,'fcode','string',0,NULL,NULL,NULL,'001',NULL,'2019-06-11 02:11:56.698','2019-06-11 02:11:56.698'),('7506','7505','7505',NULL,'employeeName','null',1,NULL,NULL,NULL,NULL,NULL,'2019-06-03 01:13:58.782','2019-06-03 02:50:59.055');

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

insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('17567',2,'string','employeeName','17566','17566',NULL,NULL,NULL,NULL,'lsp',NULL),('17569',1,'string','name','17566','17566',NULL,NULL,NULL,NULL,'lsp',NULL),('17570',1,'string','age','17566','17566',NULL,NULL,NULL,NULL,'30',NULL),('17577',1,'string','vacationApproved','17566','17566',NULL,NULL,NULL,NULL,'false',NULL),('17578',1,'string','managerMotivation','17566','17566',NULL,NULL,NULL,NULL,'true',NULL),('17583',1,'null','employeeName','17582','17582',NULL,NULL,NULL,NULL,NULL,NULL),('17585',1,'string','name','17582','17582',NULL,NULL,NULL,NULL,'lsp',NULL),('17586',1,'string','age','17582','17582',NULL,NULL,NULL,NULL,'30',NULL),('17591',1,'string','name1','17582','17582',NULL,NULL,NULL,NULL,'lsp',NULL),('17592',2,'string','name_lsp','17582','17582','17588',NULL,NULL,NULL,'name_lsp',NULL),('17593',1,'string','name','17582','17582','17588',NULL,NULL,NULL,'lsp1',NULL),('17599',1,'string','employeeName','12537','12537',NULL,NULL,NULL,NULL,'lsp',NULL),('17600',1,'string','vacationApproved','12537','12537',NULL,NULL,NULL,NULL,'false',NULL),('17601',1,'string','managerMotivation','12537','12537',NULL,NULL,NULL,NULL,'true',NULL),('17625',1,'string','resendRequest','17566','17566',NULL,NULL,NULL,NULL,'true',NULL),('22506',5,'string','employeeName','22505','22505',NULL,NULL,NULL,NULL,'shengpengliu',NULL),('22508',1,'string','myVar','22505','22505',NULL,NULL,NULL,NULL,'This is a variable',NULL),('30001',1,'string','vacationApproved','22505','22505',NULL,NULL,NULL,NULL,'false',NULL),('30002',1,'string','managerMotivation','22505','22505',NULL,NULL,NULL,NULL,'true',NULL),('30003',1,'string','resendRequest','22505','22505',NULL,NULL,NULL,NULL,'true',NULL),('32501',1,'string','resendRequest','12537','12537',NULL,NULL,NULL,NULL,'true',NULL),('52502',2,'string','name','22505','22505',NULL,NULL,NULL,NULL,'shengpengliu111',NULL),('55045',1,'null','numberOfDays','22505','22505',NULL,NULL,NULL,NULL,NULL,NULL),('55046',1,'null','startDate','22505','22505',NULL,NULL,NULL,NULL,NULL,NULL),('55047',1,'string','vacationMotivation','22505','22505',NULL,NULL,NULL,NULL,'',NULL),('55048',1,'string','fname','22505','22505',NULL,NULL,NULL,NULL,'å¼ ä¸‰è¯·å‡å•',NULL),('55049',1,'string','fbegindate','22505','22505',NULL,NULL,NULL,NULL,'2019-06-05',NULL),('55050',1,'string','fapplyuser','22505','22505',NULL,NULL,NULL,NULL,'å¼ ä¸‰',NULL),('55051',1,'string','message','22505','22505',NULL,NULL,NULL,NULL,'æ²¡æœ‰æ„è§ï¼Œå¥½å¥½æ´»ç€',NULL),('55052',1,'string','fenddate','22505','22505',NULL,NULL,NULL,NULL,'2019-06-10',NULL),('55053',1,'string','fapplyreason','22505','22505',NULL,NULL,NULL,NULL,'ç”Ÿç—…è¯·å‡å‡ å¤©',NULL),('55054',1,'string','fapplytype','22505','22505',NULL,NULL,NULL,NULL,'äº‹å‡',NULL),('55055',1,'string','processInstaceId','22505','22505',NULL,NULL,NULL,NULL,'22505',NULL),('55056',1,'string','fcode','22505','22505',NULL,NULL,NULL,NULL,'001',NULL);

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

insert  into `t_hi_vacation`(`task_id`,`id`,`fcode`,`fname`,`fapplyuser`,`fapplytype`,`fbegindate`,`fenddate`,`fapplyreason`) values ('42503',1,'001','å¼ ä¸‰è¯·å‡å•','å¼ ä¸‰','äº‹å‡','2019-06-05 00:00:00.000','2019-06-10 00:00:00.000','ç”Ÿç—…è¯·å‡å‡ å¤©'),('42508',2,'001','å¼ ä¸‰è¯·å‡å•','å¼ ä¸‰','äº‹å‡','2019-06-05 00:00:00.000','2019-06-10 00:00:00.000','ç”Ÿç—…è¯·å‡å‡ å¤©'),('45008',3,'001','å¼ ä¸‰è¯·å‡å•','å¼ ä¸‰','äº‹å‡','2019-06-05 00:00:00.000','2019-06-10 00:00:00.000','ç”Ÿç—…è¯·å‡å‡ å¤©'),('47504',4,'001','å¼ ä¸‰è¯·å‡å•','å¼ ä¸‰','äº‹å‡','2019-06-05 00:00:00.000','2019-06-10 00:00:00.000','ç”Ÿç—…è¯·å‡å‡ å¤©'),('50004',5,'001','å¼ ä¸‰è¯·å‡å•','å¼ ä¸‰','äº‹å‡','2019-06-05 00:00:00.000','2019-06-10 00:00:00.000','ç”Ÿç—…è¯·å‡å‡ å¤©'),('52505',6,'001','å¼ ä¸‰è¯·å‡å•','å¼ ä¸‰','äº‹å‡','2019-06-05 00:00:00.000','2019-06-10 00:00:00.000','ç”Ÿç—…è¯·å‡å‡ å¤©'),('52511',7,'001','å¼ ä¸‰è¯·å‡å•','å¼ ä¸‰','äº‹å‡','2019-06-05 00:00:00.000','2019-06-10 00:00:00.000','ç”Ÿç—…è¯·å‡å‡ å¤©'),('55059',8,'001','å¼ ä¸‰è¯·å‡å•','å¼ ä¸‰','äº‹å‡','2019-06-05 00:00:00.000','2019-06-10 00:00:00.000','ç”Ÿç—…è¯·å‡å‡ å¤©');

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
  `is_leader_group` bigint(1) DEFAULT NULL COMMENT '0-ä¸æ˜¯é¢†å¯¼ç»„ï¼Œ1-æ˜¯é¢†å¯¼ç»„',
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

insert  into `t_vacation`(`task_id`,`id`,`fcode`,`fname`,`fapplyuser`,`fapplytype`,`fbegindate`,`fenddate`,`fapplyreason`) values ('55059',8,'001','å¼ ä¸‰è¯·å‡å•','å¼ ä¸‰','äº‹å‡','2019-06-05 00:00:00.000','2019-06-10 00:00:00.000','ç”Ÿç—…è¯·å‡å‡ å¤©');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
