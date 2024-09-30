using OfficeAutomationServiceClient.PersonServiceProxy;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace WindowsFormsApplicationTest
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }
        int perId = 434118;
        int depId = 1646343;
        string SystemName = "simapws";
        string SystemPass = "simap@1398";

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
                  //  _securityContextWTOPerson.username = UserName;
                }
                return _securityContextWTOPerson;
            }
            set { _securityContextWTOPerson = value; }
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
        private void button1_Click(object sender, EventArgs e)
        {
            MessageBox.Show(GetPersonDepartmentsID(261438).ToString());
        }
        public int GetPersonDepartmentsID(int? personID = null)
        {
            if (personID != null)
            {
                SecurityContextWTOPerson.perId = personID.Value;
            }

            OfficeAutomationServiceClient.PersonServiceProxy.com_gam_secretariat_webservice_complextypes_ItemWTO[] actual = PersonServiceClient.getPersonDepartments(SecurityContextWTOPerson);

            return actual[0].id;
        }
    }
}
