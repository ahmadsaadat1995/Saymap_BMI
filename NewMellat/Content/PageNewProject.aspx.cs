using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace NewMellat.Content
{
    public partial class PageNewProject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PersianCalendar1.Date = DateTime.Now;
                pcChk1.Date = DateTime.Now;
                pcChk2.Date = DateTime.Now;
                pcChk3.Date = DateTime.Now;
                PersianCalendar6.Date = DateTime.Now;


            }


            // کنترل امنیت
            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
            {
                Response.Redirect(@"~\content\PageDenied.aspx");
            }





            if (!SecurityClass.IsAccess(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath), 2))
            {
               // Button2.Enabled = false;

            }
            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = "ثبت درخواست جدید";



            sourceVahed.SelectParameters["prCode"].DefaultValue = Page.User.Identity.Name;
            sourceVahed2.SelectParameters["prCode"].DefaultValue = Page.User.Identity.Name;
            sourcePeymankar.SelectParameters["prCode"].DefaultValue = Page.User.Identity.Name;


        }


        NewMellatEntities db = new NewMellatEntities();

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {

            var fileCount = RadUpload1.UploadedFiles.Count;
            var paperInfo =
                  db.tbProjectPapers.Where(n => n.paAct == 1 && n.paShenase == txtShenase1.Text && n.paType == 1).Select(n => n);
            // کنترل نام پروژه  
            var info = db.tbProjects.Where(n => n.prAct == 1 && n.prTitle.Contains(txtTitle1.Text)).Select(n => n);
            if (fileCount > 0)
            {
                if (!info.Any() && !paperInfo.Any())
                {


                    // ثبت پروژه جدید
                    sourceProject.InsertParameters["prRegUser"].DefaultValue = Page.User.Identity.Name;
                    sourceProject.InsertParameters["prRegDate"].DefaultValue = DateTime.Now.ToShortDateString();
                    sourceProject.Insert();


                    //ثبت نام
                    if (!string.IsNullOrEmpty(txtShenase1.Text))
                    {
                        sourcePaper.InsertParameters["paDate"].DefaultValue =
                            PersianCalendar1.Date.ToShortDateString();
                        sourcePaper.InsertParameters["paProject"].DefaultValue = HiddenField1.Value;
                        sourcePaper.Insert();
                    }

                    lbResult.Text = "اطلاعات با موفقیت به ثبت رسید";
                    lbResult.ForeColor = Color.Green;


                    // ثبت نامه های زیر فرم

                    if (chk1.Checked)
                    {
                        sourcePa.InsertParameters["paProject"].DefaultValue = HiddenField1.Value;
                        sourcePa.InsertParameters["paDate"].DefaultValue = pcChk1.Date.ToShortDateString();
                        sourcePa.Insert();
                    }

                    if (chk2.Checked)
                    {
                        sourcePa2.InsertParameters["paProject"].DefaultValue = HiddenField1.Value;
                        sourcePa2.InsertParameters["paDate"].DefaultValue = pcChk2.Date.ToShortDateString();
                        sourcePa2.Insert();
                    }


                    if (chk3.Checked)
                    {
                        sourcePa3.InsertParameters["paProject"].DefaultValue = HiddenField1.Value;
                        sourcePa3.InsertParameters["paDate"].DefaultValue = pcChk3.Date.ToShortDateString();
                        sourcePa3.Insert();
                    }

                    //-----------------------------------------------------------

                    foreach (Telerik.Web.UI.UploadedFile file in RadUpload1.UploadedFiles)
                    {

                        tbFile newFile = new tbFile();
                        newFile.fiAct = 1;

                        byte[] fileData = new byte[file.InputStream.Length];
                        file.InputStream.Read(fileData, 0, (int)file.InputStream.Length);
                        newFile.fiData = fileData;

                        newFile.fiDate = DateTime.Now;
                        newFile.fiExt = Path.GetFileName(file.FileName);
                        newFile.fiParent = Convert.ToInt32(HiddenField1.Value);
                        newFile.fiTitle = txtTitle1.Text;
                        newFile.fiType = 1;
                        db.tbFiles.Add(newFile);
                        db.SaveChanges();
                        RadNotification1.Show("درخواست پروژه جدید با موفقیت به ثبت رسید");


                        // ثبت index
                        if (drpRequestType.Value.ToString() == "179")
                        {
                            source1.InsertParameters["inProject"].DefaultValue = HiddenField1.Value;
                            source1.Insert();
                        }
                        else if (drpRequestType.Value.ToString() == "178")
                        {
                            source2.InsertParameters["inProject"].DefaultValue = HiddenField1.Value;
                            source2.Insert();
                        }
                        else if (drpRequestType.Value.ToString() == "3")
                        {
                            source3.InsertParameters["inProject"].DefaultValue = HiddenField1.Value;
                            source3.InsertParameters["inDateStart"].DefaultValue = PersianCalendar6.Date.ToShortDateString();
                            source3.Insert();
                        }

                    }
                }
                else
                {
                    RadNotification1.Show("اطلاعات نام پروژه یا شناسه نامه تکراری می باشد");

                }

            }
            else
            {
                RadNotification1.Show("فایل ضمیمه انتخاب نشده است");

            }
        }


        protected void sourceProject_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            int intId = (int)e.Command.Parameters["@prId"].Value;
            HiddenField1.Value = intId.ToString();


            var item = db.tbProjects.SingleOrDefault(n => n.prId == intId);
            item.prFinalCode = item.prPeymankar.ToString().PadLeft(3, '0') +
                  item.prVahed.ToString().PadLeft(3, '0') +
                  item.prProjectType.ToString().PadLeft(3, '0') +
                  item.prSanadType.ToString().PadLeft(3, '0') +
                  item.prId.ToString().PadLeft(4, '0');
            if (item.TechnicalSuvisor == -1)
                item.TechnicalSuvisor = null;
            db.SaveChanges();
        }

        protected void drpProjectType_DataBound(object sender, EventArgs e)
        {
            drpProjectType.Items.Insert(0, new ListEditItem("انتخاب", "-1"));
            drpProjectType.SelectedIndex = 0;
        }

        protected void drpVahed_DataBound(object sender, EventArgs e)
        {
            //drpVahed.Items.RemoveAt(0);
            //drpVahed.Items.RemoveAt(1);
            //drpVahed.Items.RemoveAt(2);



            drpVahed.Items.Insert(0, new ListEditItem("انتخاب", "-1"));
            drpVahed.SelectedIndex = 0;


        }
        protected void drpVahed2_DataBound(object sender, EventArgs e)
        {
            //drpVahed.Items.RemoveAt(0);
            //drpVahed.Items.RemoveAt(1);
            //drpVahed.Items.RemoveAt(2);



            ASPxComboBoxNazerFani.Items.Insert(0, new ListEditItem("انتخاب", "-1"));
            ASPxComboBoxNazerFani.SelectedIndex = 0;


        }

        protected void drpSanadType_DataBound(object sender, EventArgs e)
        {
            drpSanadType.Items.Insert(0, new ListEditItem("انتخاب", "-1"));
            drpSanadType.SelectedIndex = 0;
        }

        protected void drpPeymankar_DataBound(object sender, EventArgs e)
        {
            drpPeymankar.Items.Insert(0, new ListEditItem("انتخاب", "-1"));
            drpPeymankar.SelectedIndex = 0;

        }

        protected void drpOlaviat_DataBound(object sender, EventArgs e)
        {
            drpOlaviat.Items.Insert(0, new ListEditItem("انتخاب", "-1"));
            drpOlaviat.SelectedIndex = 0;
        }

        protected void drpRequestType_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void drpProjectType_SelectedIndexChanged(object sender, EventArgs e)
        {
        }




        protected void drpVahed_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
    }
}