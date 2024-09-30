using System;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Collections.Generic;
using OfficeAutomationServiceClient.LetterServiceProxy;
using OfficeAutomationServiceClient.PersonServiceProxy;
using OfficeAutomationServiceClient.MessageServiceProxy;
using OfficeAutomationServiceClient.DeliverServiceProxy;
using OfficeAutomationServiceClient.ListProviderServiceProxy;
using System.IO;
using DocumentFormat.OpenXml.Packaging;

namespace NewMellat.gam
{
    public class BaseClientSymap
    {
        public BaseClientSymap() { }
        public BaseClientSymap(int personID, string userName)
        {
            this.personID = personID;
            this.UserName = userName;
        }
       public int pIdHadimanesh = 16933;
        public string usrHadimanesh = "434118";
        public int depIdHadimanesh = 1814302;
        public BaseClientSymap(string symapLoginName){
             switch (symapLoginName)
            {
                case "e.abdollahi":
                case "abdolahi.eh":
                    this.personID = 18814;
                    this.UserName = "0082393958";
                    break;
                case "m.mosayebi":
                    this.personID  = 509152;
                    this.UserName = "0012273791";
                    break;
                case "m.teymour":
                    this.personID  = 1793124;
                    this.UserName = "2122636521";
                    break;
                case "m.khanahmadi":
                    this.personID  = 1289147;
                    this.UserName = "0019482264";
                    break;
                case "a.hadimanesh":
                case "hadimanesh":
                    this.personID  = pIdHadimanesh;
                    this.UserName = usrHadimanesh;
                    break;

            }
        }
        #region Properties
        public int personID;
        public string SystemName
        {
            get
            {
                return ConfigurationManager.AppSettings["SystemName"];
            }
        }
        public string SystemPass
        {
            get
            {
                return ConfigurationManager.AppSettings["SystemPass"];
            }
        }
        public string UserName;
        //{
        //    get
        //    {
        //        return ConfigurationManager.AppSettings["UserName"];
        //    }
        //}
        public string AccessType
        {
            get
            {
                return ConfigurationManager.AppSettings["AccessType"];
            }
        }
        public string TransferType
        {
            get
            {
                return ConfigurationManager.AppSettings["TransferType"];
            }
        }
        public string NameSearchString
        {
            get
            {
                return ConfigurationManager.AppSettings["NameSearchString"];
            }
        }
        public int LetterID
        {
            get
            {
                return int.Parse(ConfigurationManager.AppSettings["LetterID"]);
            }
        }

        private PersonServicePortTypeClient _personServiceClient;
        public PersonServicePortTypeClient PersonServiceClient
        {
            get
            {
                if (_personServiceClient == null)
                {
                    _personServiceClient = new PersonServicePortTypeClient();
                }
                return _personServiceClient;
            }
            set { _personServiceClient = value; }
        }

        private ListProviderServicePortTypeClient _listProviderClient;
        public ListProviderServicePortTypeClient ListProviderClient
        {
            get
            {
                if (_listProviderClient == null)
                {
                    _listProviderClient = new ListProviderServicePortTypeClient();
                }
                return _listProviderClient;
            }
            set
            {
                _listProviderClient = value;
            }
        }

        private LetterServicePortTypeClient _letterServiceClient;
        public LetterServicePortTypeClient LetterServiceClient
        {
            get
            {
                if (_letterServiceClient == null)
                {
                    _letterServiceClient = new LetterServicePortTypeClient();
                }
                return _letterServiceClient;
            }
            set { _letterServiceClient = value; }
        }

        private MessageServicePortTypeClient _messageServiceClient;
        public MessageServicePortTypeClient MessageServiceClient
        {
            get
            {
                if (_messageServiceClient == null)
                {
                    _messageServiceClient = new MessageServicePortTypeClient();
                }
                return _messageServiceClient;
            }
            set { _messageServiceClient = value; }
        }

        private DeliverServicePortTypeClient _deliverServiceClient;
        public DeliverServicePortTypeClient DeliverServiceClient
        {
            get
            {
                if (_deliverServiceClient == null)
                {
                    _deliverServiceClient = new DeliverServicePortTypeClient();
                }
                return _deliverServiceClient;
            }
            set { _deliverServiceClient = value; }
        }

        private OfficeAutomationServiceClient.MessageServiceProxy.com_gam_secretariat_webservice_complextypes_SecurityContextWTO _securityContextWTOMessage;
        public OfficeAutomationServiceClient.MessageServiceProxy.com_gam_secretariat_webservice_complextypes_SecurityContextWTO SecurityContextWTOMessage
        {
            get
            {
                if (_securityContextWTOMessage == null)
                {
                    _securityContextWTOMessage = new OfficeAutomationServiceClient.MessageServiceProxy.com_gam_secretariat_webservice_complextypes_SecurityContextWTO();
                    _securityContextWTOMessage.systemName = SystemName;
                    _securityContextWTOMessage.systemPass = SystemPass;
                    _securityContextWTOMessage.username = UserName;
                }
                return _securityContextWTOMessage;
            }
            set { _securityContextWTOMessage = value; }
        }

        private OfficeAutomationServiceClient.PersonServiceProxy.com_gam_secretariat_webservice_complextypes_SecurityContextWTO _securityContextWTOPerson;
        public OfficeAutomationServiceClient.PersonServiceProxy.com_gam_secretariat_webservice_complextypes_SecurityContextWTO SecurityContextWTOPerson
        {
            get
            {
                if (_securityContextWTOPerson == null)
                {
                    _securityContextWTOPerson = new OfficeAutomationServiceClient.PersonServiceProxy.com_gam_secretariat_webservice_complextypes_SecurityContextWTO();
                    _securityContextWTOPerson.systemName = SystemName;
                    _securityContextWTOPerson.systemPass = SystemPass;
                    _securityContextWTOPerson.username = UserName;
                }
                return _securityContextWTOPerson;
            }
            set { _securityContextWTOPerson = value; }
        }

        private OfficeAutomationServiceClient.ListProviderServiceProxy.com_gam_secretariat_webservice_complextypes_SecurityContextWTO _securityContextWTOListProvider;
        public OfficeAutomationServiceClient.ListProviderServiceProxy.com_gam_secretariat_webservice_complextypes_SecurityContextWTO SecurityContextWTOListProvider
        {
            get
            {
                if (_securityContextWTOListProvider == null)
                {
                    _securityContextWTOListProvider = new OfficeAutomationServiceClient.ListProviderServiceProxy.com_gam_secretariat_webservice_complextypes_SecurityContextWTO();
                    _securityContextWTOListProvider.systemName = SystemName;
                    _securityContextWTOListProvider.systemPass = SystemPass;
                    _securityContextWTOListProvider.username = UserName;
                }
                return _securityContextWTOListProvider;
            }
            set
            {
                _securityContextWTOListProvider = value;
            }
        }

        private OfficeAutomationServiceClient.LetterServiceProxy.com_gam_secretariat_webservice_complextypes_SecurityContextWTO _securityContextWTOLetterService;
        public OfficeAutomationServiceClient.LetterServiceProxy.com_gam_secretariat_webservice_complextypes_SecurityContextWTO SecurityContextWTOLetterService
        {
            get
            {
                if (_securityContextWTOLetterService == null)
                {
                    _securityContextWTOLetterService = new OfficeAutomationServiceClient.LetterServiceProxy.com_gam_secretariat_webservice_complextypes_SecurityContextWTO();
                    _securityContextWTOLetterService.systemName = SystemName;
                    _securityContextWTOLetterService.systemPass = SystemPass;
                    _securityContextWTOLetterService.username = UserName;
                }

                return _securityContextWTOLetterService;
            }
            set
            {
                _securityContextWTOLetterService = value;
            }
        }

        private OfficeAutomationServiceClient.DeliverServiceProxy.com_gam_secretariat_webservice_complextypes_SecurityContextWTO _securityContextWTODeliverService;
        public OfficeAutomationServiceClient.DeliverServiceProxy.com_gam_secretariat_webservice_complextypes_SecurityContextWTO SecurityContextWTODeliverService
        {
            get
            {
                if (_securityContextWTODeliverService == null)
                {
                    _securityContextWTODeliverService = new OfficeAutomationServiceClient.DeliverServiceProxy.com_gam_secretariat_webservice_complextypes_SecurityContextWTO();
                    _securityContextWTODeliverService.systemName = SystemName;
                    _securityContextWTODeliverService.systemPass = SystemPass;
                    _securityContextWTODeliverService.username = UserName;
                }
                return _securityContextWTODeliverService;
            }
            set { _securityContextWTODeliverService = value; }
        }

        #endregion

        #region Public Methods

        /// <summary>
        /// This method gets personDepartments from getPersonDepartments method which is in PersonService and lets the first one to be return value.
        /// </summary>
        /// <param name="personID"></param>
        /// <returns></returns>
        public int GetPersonDepartmentsID()
        {
            if (personID != null)
            {
                SecurityContextWTOPerson.perId = personID;
            }

            OfficeAutomationServiceClient.PersonServiceProxy.com_gam_secretariat_webservice_complextypes_ItemWTO[] actual = PersonServiceClient.getPersonDepartments(SecurityContextWTOPerson);          
            return actual[0].id;
        }

        /// <summary>
        /// This method gets DocumentTypes from getDocumentTypes which is in ListProviderService and lets the first one to be retur value.
        /// </summary>
        /// <returns></returns>
        public int GetDocTypeId()
        {
            SecurityContextWTOListProvider.depId = this.GetPersonDepartmentsID();
            OfficeAutomationServiceClient.ListProviderServiceProxy.com_gam_secretariat_webservice_complextypes_ListProviderWTO param1 = new OfficeAutomationServiceClient.ListProviderServiceProxy.com_gam_secretariat_webservice_complextypes_ListProviderWTO();
            OfficeAutomationServiceClient.ListProviderServiceProxy.com_gam_secretariat_webservice_complextypes_ListResultWTO[] actual = ListProviderClient.getDocumentTypes(SecurityContextWTOListProvider, param1);
 
            return actual[0].id1;
        }

        //public int getLetterSigners(int perId)
        //{
        //    SecurityContextWTOListProvider.depId = this.GetPersonDepartmentsID();
        //    OfficeAutomationServiceClient.ListProviderServiceProxy.com_gam_secretariat_webservice_complextypes_ListProviderWTO param1 = new OfficeAutomationServiceClient.ListProviderServiceProxy.com_gam_secretariat_webservice_complextypes_ListProviderWTO();
        //    OfficeAutomationServiceClient.ListProviderServiceProxy.com_gam_secretariat_webservice_complextypes_ListResultWTO[] actual = ListProviderClient.getDocumentTypes(SecurityContextWTOListProvider, param1);

        //    return actual[0].id1;
        //}

        /// <summary>
        /// This method gets priorities list from getPriorities methos which is in ListProviderService and lets the first one to be the return value.
        /// </summary>
        /// <returns></returns>
        public int GetPriorityId()
        {
            SecurityContextWTOListProvider.depId = this.GetPersonDepartmentsID();
            OfficeAutomationServiceClient.ListProviderServiceProxy.com_gam_secretariat_webservice_complextypes_ListProviderWTO param1 = new OfficeAutomationServiceClient.ListProviderServiceProxy.com_gam_secretariat_webservice_complextypes_ListProviderWTO();
            OfficeAutomationServiceClient.ListProviderServiceProxy.com_gam_secretariat_webservice_complextypes_ListResultWTO[] actual = ListProviderClient.getPriorities(SecurityContextWTOListProvider, param1);
            return actual[0].id1;
        }

        public int[] GetSubjectIds(string subject)
        {
            SecurityContextWTOListProvider.depId = this.GetPersonDepartmentsID();
            OfficeAutomationServiceClient.ListProviderServiceProxy.com_gam_secretariat_webservice_complextypes_ListProviderWTO param1 = new OfficeAutomationServiceClient.ListProviderServiceProxy.com_gam_secretariat_webservice_complextypes_ListProviderWTO();
            param1.searchString = subject;
            OfficeAutomationServiceClient.ListProviderServiceProxy.com_gam_secretariat_webservice_complextypes_ListResultWTO[] actual = ListProviderClient.getLetterSubjects(SecurityContextWTOListProvider, param1);
            // actual[0].id1;
            return new int[] { actual[0].id1 };

        }
        /// <summary>
        /// This method gets letterReceivers list from getLetterRecievers method which is in ListProviderService and lets the first one with personID and departmentID be the return value.
        /// </summary>
        /// <returns></returns>
        public com_gam_secretariat_webservice_complextypes_PersonDepartmentWTO[] GetLetterReceivers(string[] ReceiverNames)
        {
            SecurityContextWTOListProvider.depId = this.GetPersonDepartmentsID();
            OfficeAutomationServiceClient.ListProviderServiceProxy.com_gam_secretariat_webservice_complextypes_ListProviderWTO param1 =
                new OfficeAutomationServiceClient.ListProviderServiceProxy.com_gam_secretariat_webservice_complextypes_ListProviderWTO();
            com_gam_secretariat_webservice_complextypes_PersonDepartmentWTO[] result = new com_gam_secretariat_webservice_complextypes_PersonDepartmentWTO[ReceiverNames.Length];

            for (int i = 0; i < ReceiverNames.Length; i++)
            {
                param1.searchString = ReceiverNames[i];
                OfficeAutomationServiceClient.ListProviderServiceProxy.com_gam_secretariat_webservice_complextypes_ListResultWTO[] actual = ListProviderClient.getLetterReceivers(SecurityContextWTOListProvider, param1);

                result[i] = new com_gam_secretariat_webservice_complextypes_PersonDepartmentWTO();
                if (actual != null)
                {

                    result[i].personId = actual[0].id1;
                    result[i].departmentId = actual[0].id2;

                }

            }
            return result;
        }

        public void getLetterProducers(int perId) {

        }

        #endregion

        #region My Methods
        public byte[] createFile(string templateName, Dictionary<string, string> param)
        {
            string path = "D:\\Projects\\NewMellat\\letterTemplate\\";
            string destinationFile = path + "temp\\" + Guid.NewGuid().ToString() + ".docx";
           // string destinationFile = path + "temp\\xx.docx";
            File.Copy(path + templateName + ".docx", destinationFile);


            using (WordprocessingDocument wordDoc = WordprocessingDocument.Open(destinationFile, true))
            {
                string docText = null;
                using (StreamReader sr = new StreamReader(wordDoc.MainDocumentPart.GetStream()))
                    docText = sr.ReadToEnd();

                foreach (var item in param)
                {
                    docText = docText.Replace(item.Key, item.Value);
                }


                using (StreamWriter sw = new StreamWriter(wordDoc.MainDocumentPart.GetStream(FileMode.Create)))
                    sw.Write(docText);

                //  MessageBox.Show("done");


            }
            return System.IO.File.ReadAllBytes(destinationFile);
            // File.Delete(destinationFile);
        }
      
         
        #endregion
    }
}
