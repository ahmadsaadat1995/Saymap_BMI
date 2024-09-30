using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewMellat.Content
{
    public partial class PageCapacity : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label panel = (Label)this.Master.FindControl("lbHeader");
            panel.Text = "ظرفیت شرکت";
            if (!SecurityClass.IsAccess(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath), 3))
            {
                Button2.Enabled = false;
            }

            // کنترل امنیت
            if (!SecurityClass.IsValid(Page.User.Identity.Name, Path.GetFileName(Request.Url.AbsolutePath)))
            {
                Response.Redirect(@"~\content\PageDenied.aspx");
            }
            if (!IsPostBack)
            {
                PersianCalendar pCal = new PersianCalendar();
                int year = pCal.GetYear(DateTime.Now);
                for (int i = 1393; i < year + 2; i++)
                {
                    ASPxComboBoxYear.Items.Add(new DevExpress.Web.ListEditItem(i.ToString(), i));
                }

                ASPxComboBoxYear.DataBind();

            }
        }

        NewMellatEntities db = new NewMellatEntities();

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {

            int compId = Convert.ToInt32(ASPxComboBoxCompany.Value);
            int year = Convert.ToInt32(ASPxComboBoxYear.Value);
            
            if (Convert.ToInt32(ASPxComboBoxCompany.Value) > 0 && Convert.ToInt32(ASPxComboBoxYear.Value) > 0)
            {
                CapacityCompany cc= db.CapacityCompanies.Where(c => c.CompanyId == compId && c.Year == year).FirstOrDefault();
                if (cc != null)
                {
                    cc.Description = TextBoxNote.Text;

                }
                else
                {
                    cc = new CapacityCompany();
                    cc.Year = year;
                    cc.CompanyId = compId;
                    cc.Description = TextBoxNote.Text;
                    db.CapacityCompanies.Add(cc);
                }
                List<Capacity> cap = db.Capacities.Where(c => c.CompanyId == compId && c.Year == year).ToList();
                for (int i = 1; i < 5; i++)
                {
                    for (int j = 1; j < 6; j++)
                    {
                        Capacity c = cap.FirstOrDefault(ca => ca.Season == i && ca.CapacityTypeId == j);
                        try
                        {
                            if (c == null)
                            {
                                c = new Capacity();
                                c.Season = i;
                                c.Year = year;
                                c.CompanyId = compId;
                                c.CapacityTypeId = j;
                                db.Capacities.Add(c);
                                db.SaveChanges();
                            }
                            if (i == 1)
                            {
                                switch (j)
                                {
                                    case 1:
                                        c.CapacityValue = Convert.ToInt32(TextBoxBaharSeporde.Text);
                                        c.CapacityTypeId = 1;
                                        
                                        break;
                                    case 2:
                                        c.CapacityValue = Convert.ToInt32(TextBoxBaharTashilat.Text);
                                        c.CapacityTypeId = 2;
                                        
                                        break;
                                    case 3:
                                        c.CapacityValue = Convert.ToInt32(TextBoxBaharInterneti.Text);
                                        c.CapacityTypeId = 3;
                                        break;
                                    case 4:
                                        c.CapacityValue = Convert.ToInt32(TextBoxBaharGozareshat.Text);
                                        c.CapacityTypeId = 4;
                                        break;
                                    default:
                                        break;
                                }
                                
                            }
                            else if (i == 2)
                            {
                                switch (j)
                                {
                                    case 1:
                                        c.CapacityValue = Convert.ToInt32(TextBoxTabestanSeporde.Text);
                                        c.CapacityTypeId = 1;
                                        
                                        break;
                                    case 2:
                                        c.CapacityValue = Convert.ToInt32(TextBoxTabestanTashilat.Text);
                                        c.CapacityTypeId = 2;
                                        
                                        break;
                                    
                                    case 3:
                                        c.CapacityValue = Convert.ToInt32(TextBoxTabestanInterneti.Text);
                                        c.CapacityTypeId = 3;
                                        break;
                                    case 4:
                                        c.CapacityValue = Convert.ToInt32(TextBoxPaeezGozareshat.Text);
                                        c.CapacityTypeId = 4;
                                        break;
                                    default:
                                        break;
                                }
                                
                            }
                            else if (i == 3)
                            {
                                switch (j)
                                {
                                    case 1:
                                        c.CapacityValue = Convert.ToInt32(TextBoxPaeezSeporde.Text);
                                        c.CapacityTypeId = 1;
                                        break;

                                    case 2:
                                        c.CapacityValue = Convert.ToInt32(TextBoxPaeezTashilat.Text);
                                        c.CapacityTypeId = 2;
                                        break;
                                    
                                    case 3:
                                        c.CapacityValue = Convert.ToInt32(TextBoxPaeezInterneti.Text);
                                        c.CapacityTypeId = 3;
                                        break;
                                    case 4:
                                        c.CapacityValue = Convert.ToInt32(TextBoxPaeezGozareshat.Text);
                                        c.CapacityTypeId = 4;
                                        break;
                                    default:
                                        break;
                                }
                            }
                            else if (i == 4)
                            {
                                switch (j)
                                {
                                    case 1:
                                        c.CapacityValue = Convert.ToInt32(TextBoxZemestanSeporde.Text);
                                        c.CapacityTypeId = 1;
                                        break;
                                    case 2:
                                        c.CapacityValue = Convert.ToInt32(TextBoxZemestanTashilat.Text);
                                        c.CapacityTypeId = 2;
                                        break;
                                    case 3:
                                        c.CapacityValue = Convert.ToInt32(TextBoxZemestanInterneti.Text);
                                        c.CapacityTypeId = 3;
                                        break;
                                    case 4:
                                        c.CapacityValue = Convert.ToInt32(TextBoxZemestanGozareshat.Text);
                                        c.CapacityTypeId = 4;
                                        break;
                                    default:
                                        break;
                                }
                            }
                        }
                        catch (Exception)
                        {


                        }

                    }
                    db.SaveChanges();
                }

            }
        }
        protected void ASPxComboBoxCompany_DataBound(object sender, EventArgs e)
        {
            ASPxComboBoxCompany.Items.Insert(0, new DevExpress.Web.ListEditItem("انتخاب", "-1"));
            ASPxComboBoxCompany.SelectedIndex = 0;

        }
        protected void ASPxComboBoxYear_DataBound(object sender, EventArgs e)
        {
            ASPxComboBoxYear.Items.Insert(0, new DevExpress.Web.ListEditItem("انتخاب", "-1"));
            ASPxComboBoxYear.SelectedIndex = 0;

        }
        protected void ASPxComboBoxCompany_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadData();
        }
        protected void ASPxComboBoxYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadData();
        }
        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {

            ASPxGridViewExporter1.WriteXlsxToResponse();

        }
        private void LoadData()
        {
            int compId = Convert.ToInt32(ASPxComboBoxCompany.Value);
            int year = Convert.ToInt32(ASPxComboBoxYear.Value);
            if (Convert.ToInt32(ASPxComboBoxCompany.Value) > 0 && Convert.ToInt32(ASPxComboBoxYear.Value) > 0)
            {
                CapacityCompany cc = db.CapacityCompanies.Where(c => c.CompanyId == compId && c.Year == year).FirstOrDefault();
                if (cc != null)
                {
                    TextBoxNote.Text = cc.Description;

                }
                List<Capacity> cap = db.Capacities.Where(c => c.CompanyId == compId && c.Year == year).ToList();
                foreach (Capacity c in cap)
                {
                    if (c.Season == 1)
                    {
                        switch (c.CapacityTypeId)
                        {
                            case 1:
                                TextBoxBaharSeporde.Text = c.CapacityValue.ToString();
                                break;
                            case 2:
                                TextBoxBaharTashilat.Text = c.CapacityValue.ToString();
                                break;
                            case 3:
                                TextBoxBaharInterneti.Text = c.CapacityValue.ToString();
                                break;
                            case 4:
                                TextBoxBaharGozareshat.Text = c.CapacityValue.ToString();
                                break;
                            default:
                                break;
                        }
                    }
                    else if (c.Season == 2)
                    {
                        switch (c.CapacityTypeId)
                        {
                            case 1:
                                TextBoxTabestanSeporde.Text = c.CapacityValue.ToString();
                                break;
                            case 2:
                                TextBoxTabestanTashilat.Text = c.CapacityValue.ToString();
                                break;

                            case 3:
                                TextBoxTabestanInterneti.Text = c.CapacityValue.ToString();
                                break;
                            case 4:
                                TextBoxTabestanGozareshat.Text = c.CapacityValue.ToString();
                                break;
                            default:
                                break;
                        }
                    }
                    else if (c.Season == 3)
                    {
                        switch (c.CapacityTypeId)
                        {
                            case 1:
                                TextBoxPaeezSeporde.Text = c.CapacityValue.ToString();
                                break;
                            case 2:
                                TextBoxPaeezTashilat.Text = c.CapacityValue.ToString();
                                break;
                            case 3:
                                TextBoxPaeezInterneti.Text = c.CapacityValue.ToString();
                                break;
                            case 4:
                                TextBoxPaeezGozareshat.Text = c.CapacityValue.ToString();
                                break;
                            default:
                                break;
                        }
                        
                    }
                    else if (c.Season == 4)
                    {
                        switch (c.CapacityTypeId)
                        {
                            case 1:
                                TextBoxZemestanSeporde.Text = c.CapacityValue.ToString();
                                break;
                            case 2:
                                TextBoxZemestanTashilat.Text = c.CapacityValue.ToString();
                                break;
                           
                            case 3:
                                TextBoxZemestanInterneti.Text = c.CapacityValue.ToString();
                                break;
                            case 4:
                                TextBoxZemestanGozareshat.Text = c.CapacityValue.ToString();
                                break;
                            default:
                                break;
                        }
                    }
                }

            }
        }
        
    }
}