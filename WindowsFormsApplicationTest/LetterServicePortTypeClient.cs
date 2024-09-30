using OfficeAutomationServiceClient.LetterServiceProxy;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Globalization;

namespace OfficeAutomationServiceTest
{
    class LetterServicePortTypeClientSymap : BaseClientSymap
    {
        #region Private Methods

        /// <summary>
        /// This method creates an array of filewto for inserting a letter with image.
        /// </summary>
        /// <returns></returns>
        private com_gam_secretariat_webservice_complextypes_FileWTO[] GetLetterImage()
        {
            com_gam_secretariat_webservice_complextypes_FileWTO[] fileArray = new com_gam_secretariat_webservice_complextypes_FileWTO[1];
            fileArray[0] = new com_gam_secretariat_webservice_complextypes_FileWTO();
            byte[] byteArray = new byte[10];
            fileArray[0].content = byteArray;
            fileArray[0].fileName = "Image For Testing Web Servie";
            return fileArray;
        }

        /// <summary>
        /// This method creates an array of items and let the first one be the letter number which comes from app.config.
        /// </summary>
        /// <returns></returns>
        private com_gam_secretariat_webservice_complextypes_Item[] GetItems()
        {
            com_gam_secretariat_webservice_complextypes_Item[] items = new com_gam_secretariat_webservice_complextypes_Item[1];
            items[0] = new com_gam_secretariat_webservice_complextypes_Item();
            items[0].key = "inputLetterNo";
            items[0].value = LetterID.ToString();
            return items;
        }

        #endregion

        #region InsertLetter

        public string insertLetterSymap()
        {

            var department = "زیر ساخت و نرم افزار";
            var company = "بهسازان ملت";
            var projectName = "توسعه سامانه بانکداری متمرکز و زیر سامانه های مرتبط 98";
            var projectNo = "98-4166";
            PersianCalendar pc = new PersianCalendar();
            DateTime thisDate = DateTime.Now;



            com_gam_secretariat_webservice_complextypes_LetterWTO param1 = new com_gam_secretariat_webservice_complextypes_LetterWTO();
            param1.letAccessType = "1";
            param1.letDocTypeId = this.GetDocTypeId();
            param1.letPriorityId = this.GetPriorityId();
            param1.letTransfer = TransferType;
            param1.letRegistrarDepId = 1646343; //this.GetPersonDepartmentsID();
            
            param1.receivers = this.GetLetterReceivers(department);
            ////////////////////////////////////////////////////////////////////////////
            Microsoft.Office.Interop.Word.Application app = new Microsoft.Office.Interop.Word.Application();
            Microsoft.Office.Interop.Word.Document doc = app.Documents.Open("D:\\Projects\\NewMellat\\letterTemplate\\estelamSoratHesab.doc");

            object missing = System.Reflection.Missing.Value;
            app.Visible = false;
            //doc.Content.Text = doc.Content.Text.Replace("*0*", department)
            //                                   .Replace("*1*", "......1.......")
            //                                   .Replace("*2*", "......2.......")
            //                                   .Replace("*3*", company)
            //                                   .Replace("*5*", "......5.......")
            //                                   .Replace("*6*", projectName)
            //                                   .Replace("*7*", projectNo)
            //                                   .Replace("*8*", string.Format("{2}/{1}/{0}", pc.GetYear(DateTime.Now), pc.GetMonth(DateTime.Now), pc.GetDayOfMonth(DateTime.Now)));
            string docText = doc.WordOpenXML; 
            docText=docText.Replace("*0*", department)
                                               .Replace("*1*", "......1.......")
                                               .Replace("*2*", "......2.......")
                                               .Replace("*3*", company)
                                               .Replace("*5*", "......5.......")
                                               .Replace("*6*", projectName)
                                               .Replace("*7*", projectNo)
                                               .Replace("*8*", pc.GetYear(DateTime.Now).ToString())
                                               .Replace("*9*", pc.GetMonth(DateTime.Now).ToString())
                                               .Replace("*10*", pc.GetDayOfMonth(DateTime.Now).ToString());
                                              // .Replace("*8*", string.Format("{2}/{1}/{0}", pc.GetYear(DateTime.Now), pc.GetMonth(DateTime.Now), pc.GetDayOfMonth(DateTime.Now)));
            byte[] bytes = Encoding.UTF8.GetBytes(docText);
            //object filename = @"D:\Projects\12345.doc";
            //doc.SaveAs2(ref filename);
            doc.Close(ref missing);
            app.Quit(ref missing);

            //////////////////////////////////////////////////////////////////////
           // byte[] bytes = System.IO.File.ReadAllBytes("../../files/doc1.docx");
            param1.body = new com_gam_secretariat_webservice_complextypes_FileWTO()
            {
                content = bytes
            };
            param1.subjectIds = this.GetSubjectIds("استعلام");

            // var x = this.GetSubjectIds();
            //Act
            var actual = LetterServiceClient.insertLetter(SecurityContextWTOLetterService, param1);
            return actual.ToString();
        }

        #endregion
    }
}
