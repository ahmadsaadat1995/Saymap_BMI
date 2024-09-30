using DocumentFormat.OpenXml.Packaging;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace NewMellat.gam
{
    public class gamHelper
    {
        public byte[] createFile(string templateName,Dictionary<string,string> param)
        {
            string path = "D:\\Projects\\NewMellat\\letterTemplate\\";           
            string destinationFile = path + "temp\\" + Guid.NewGuid().ToString() + ".docx";

            File.Copy(path + templateName+".docx", destinationFile);


            using (WordprocessingDocument wordDoc = WordprocessingDocument.Open(destinationFile, true))
            {
                string docText = null;
                using (StreamReader sr = new StreamReader(wordDoc.MainDocumentPart.GetStream()))
                    docText = sr.ReadToEnd();

                foreach (var item in param)
                {
                    docText = docText.Replace(item.Key,item.Value);
                }


                using (StreamWriter sw = new StreamWriter(wordDoc.MainDocumentPart.GetStream(FileMode.Create)))
                    sw.Write(docText);

              //  MessageBox.Show("done");


            }
            return System.IO.File.ReadAllBytes(destinationFile);
           // File.Delete(destinationFile);
        }
    }
}