using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace NewMellat.Content
{
    public partial class PageFinalDashboard : System.Web.UI.Page
    {

        int Nafar87 = 43;
        int Nafar290 = 59;
        int Nafar88 = 217;
        int Nafar291 = 58;


        int hajm87 = 174;
        int hajm290 = 174;
        int hajm88 = 174;
        int hajm291 = 174;


        ZarfiatDataContextDataContext db = new ZarfiatDataContextDataContext();


        NewMellatEntities db2 = new NewMellatEntities();

        void loadInfo(int year, string month1, string month2, string month3)
        {


            //----------------------------مصوبه هیات مدیره SRS  فوری ----------------------------------------------------
            var info_Bahar_Fori_SRS87 = db.spZarfiat(3000, .1, 7, year, month1, month2, month3, 173, 181);
            var info_Bahar_Fori_SRS290 = db.spZarfiat(4000, .1, 7, year, month1, month2, month3, 173, 181);
            var info_Bahar_Fori_SRS88 = db.spZarfiat(1500, .1, 7, year, month1, month2, month3, 173, 181);
            var info_Bahar_Fori_SRS291 = db.spZarfiat(2500, .1, 7, year, month1, month2, month3, 173, 181);


            double sum_Bahar_Fori_SRS_87 = 0;
            double sum_Bahar_Fori_SRS_290 = 0;
            double sum_Bahar_Fori_SRS_88 = 0;
            double sum_Bahar_Fori_SRS_291 = 0;

            try
            {
                sum_Bahar_Fori_SRS_87 += info_Bahar_Fori_SRS87.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_SRS_290 += info_Bahar_Fori_SRS290.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_SRS_88 += info_Bahar_Fori_SRS88.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_SRS_291 += info_Bahar_Fori_SRS291.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------

            //----------------------------سند چشم انداز SRS  فوری ----------------------------------------------------
            var info_Bahar_Fori_SRS87_2 = db.spZarfiat(3000, .1, 7, year, month1, month2, month3, 173, 179);
            var info_Bahar_Fori_SRS290_2 = db.spZarfiat(4000, .1, 7, year, month1, month2, month3, 173, 179);
            var info_Bahar_Fori_SRS88_2 = db.spZarfiat(1500, .1, 7, year, month1, month2, month3, 173, 179);
            var info_Bahar_Fori_SRS291_2 = db.spZarfiat(2500, .1, 7, year, month1, month2, month3, 173, 179);


            try
            {
                sum_Bahar_Fori_SRS_87 += info_Bahar_Fori_SRS87_2.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_SRS_290 += info_Bahar_Fori_SRS290_2.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_SRS_88 += info_Bahar_Fori_SRS88_2.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_SRS_291 += info_Bahar_Fori_SRS291_2.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------

            //----------------------------فرم تغییرات SRS  فوری ----------------------------------------------------
            var info_Bahar_Fori_SRS87_3 = db.spZarfiat(500, .1, 5, year, month1, month2, month3, 173, 178);
            var info_Bahar_Fori_SRS290_3 = db.spZarfiat(500, .1, 5, year, month1, month2, month3, 173, 178);
            var info_Bahar_Fori_SRS88_3 = db.spZarfiat(500, .1, 5, year, month1, month2, month3, 173, 178);
            var info_Bahar_Fori_SRS291_3 = db.spZarfiat(500, .1, 5, year, month1, month2, month3, 173, 178);


            try
            {
                sum_Bahar_Fori_SRS_87 += info_Bahar_Fori_SRS87_3.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_SRS_290 += info_Bahar_Fori_SRS290_3.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_SRS_88 += info_Bahar_Fori_SRS88_3.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_SRS_291 += info_Bahar_Fori_SRS291_3.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------



            //----------------------------مصوب هیات مدیره SRS  متوسط ----------------------------------------------------
            var info_Bahar_M_SRS87 = db.spZarfiat(3000, .1, 14, year, month1, month2, month3, 174, 181);
            var info_Bahar_M_SRS290 = db.spZarfiat(4000, .1, 14, year, month1, month2, month3, 174, 181);
            var info_Bahar_M_SRS88 = db.spZarfiat(1500, .1, 14, year, month1, month2, month3, 174, 181);
            var info_Bahar_M_SRS291 = db.spZarfiat(2500, .1, 14, year, month1, month2, month3, 174, 181);


            double sum_Bahar_M_SRS_87 = 0;
            double sum_Bahar_M_SRS_290 = 0;
            double sum_Bahar_M_SRS_88 = 0;
            double sum_Bahar_M_SRS_291 = 0;

            try
            {
                sum_Bahar_M_SRS_87 += info_Bahar_M_SRS87.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_SRS_290 += info_Bahar_M_SRS290.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_SRS_88 += info_Bahar_M_SRS88.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_SRS_291 += info_Bahar_M_SRS291.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------

            //----------------------------سند چشم انداز SRS  متوسط ----------------------------------------------------
            var info_Bahar_M_SRS87_2 = db.spZarfiat(3000, .1, 14, year, month1, month2, month3, 174, 179);
            var info_Bahar_M_SRS290_2 = db.spZarfiat(4000, .1, 14, year, month1, month2, month3, 174, 179);
            var info_Bahar_M_SRS88_2 = db.spZarfiat(1500, .1, 14, year, month1, month2, month3, 174, 179);
            var info_Bahar_M_SRS291_2 = db.spZarfiat(2500, .1, 14, year, month1, month2, month3, 174, 179);



            try
            {
                sum_Bahar_M_SRS_87 += info_Bahar_M_SRS87_2.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_SRS_290 += info_Bahar_M_SRS290_2.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_SRS_88 += info_Bahar_M_SRS88_2.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_SRS_291 += info_Bahar_M_SRS291_2.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------

            //----------------------------فرم تغییرات SRS  متوسط ----------------------------------------------------
            var info_Bahar_M_SRS87_3 = db.spZarfiat(500, .1, 10, year, month1, month2, month3, 174, 178);
            var info_Bahar_M_SRS290_3 = db.spZarfiat(500, .1, 10, year, month1, month2, month3, 174, 178);
            var info_Bahar_M_SRS88_3 = db.spZarfiat(500, .1, 10, year, month1, month2, month3, 174, 178);
            var info_Bahar_M_SRS291_3 = db.spZarfiat(500, .1, 10, year, month1, month2, month3, 174, 178);



            try
            {
                sum_Bahar_M_SRS_87 += info_Bahar_M_SRS87_3.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_SRS_290 += info_Bahar_M_SRS290_3.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_SRS_88 += info_Bahar_M_SRS88_3.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_SRS_291 += info_Bahar_M_SRS291_3.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------


            //----------------------------مصوب هیات مدیره SRS  عادی ----------------------------------------------------
            var info_Bahar_A_SRS87 = db.spZarfiat(3000, .1, 21, year, month1, month2, month3, 175, 181);
            var info_Bahar_A_SRS290 = db.spZarfiat(4000, .1, 21, year, month1, month2, month3, 175, 181);
            var info_Bahar_A_SRS88 = db.spZarfiat(1500, .1, 21, year, month1, month2, month3, 175, 181);
            var info_Bahar_A_SRS291 = db.spZarfiat(2500, .1, 21, year, month1, month2, month3, 175, 181);


            double sum_Bahar_A_SRS_87 = 0;
            double sum_Bahar_A_SRS_290 = 0;
            double sum_Bahar_A_SRS_88 = 0;
            double sum_Bahar_A_SRS_291 = 0;

            try
            {
                sum_Bahar_A_SRS_87 += info_Bahar_A_SRS87.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_SRS_290 += info_Bahar_A_SRS290.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_SRS_88 += info_Bahar_A_SRS88.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_SRS_291 += info_Bahar_A_SRS291.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------

            //----------------------------سند چشم انداز SRS  عادی ----------------------------------------------------
            var info_Bahar_A_SRS87_2 = db.spZarfiat(3000, .1, 21, year, month1, month2, month3, 175, 179);
            var info_Bahar_A_SRS290_2 = db.spZarfiat(4000, .1, 21, year, month1, month2, month3, 175, 179);
            var info_Bahar_A_SRS88_2 = db.spZarfiat(1500, .1, 21, year, month1, month2, month3, 175, 179);
            var info_Bahar_A_SRS291_2 = db.spZarfiat(2500, .1, 21, year, month1, month2, month3, 175, 179);




            try
            {
                sum_Bahar_A_SRS_87 += info_Bahar_A_SRS87_2.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_SRS_290 += info_Bahar_A_SRS290_2.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_SRS_88 += info_Bahar_A_SRS88_2.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_SRS_291 += info_Bahar_A_SRS291_2.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------


            //----------------------------فرم تغییرات SRS  عادی ----------------------------------------------------
            var info_Bahar_A_SRS87_3 = db.spZarfiat(500, .1, 15, year, month1, month2, month3, 175, 178);
            var info_Bahar_A_SRS290_3 = db.spZarfiat(500, .1, 15, year, month1, month2, month3, 175, 178);
            var info_Bahar_A_SRS88_3 = db.spZarfiat(500, .1, 15, year, month1, month2, month3, 175, 178);
            var info_Bahar_A_SRS291_3 = db.spZarfiat(500, .1, 15, year, month1, month2, month3, 175, 178);



            try
            {
                sum_Bahar_A_SRS_87 += info_Bahar_A_SRS87_3.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_SRS_290 += info_Bahar_A_SRS290_3.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_SRS_88 += info_Bahar_A_SRS88_3.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_SRS_291 += info_Bahar_A_SRS291_3.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------






            //----------------------------مصوب هیات مدیره PROPOZAL  فوری ----------------------------------------------------
            var info_Bahar_Fori_PROP87 = db.spZarfiat(3000, .1, 23, year, month1, month2, month3, 173, 181);
            var info_Bahar_Fori_PROP290 = db.spZarfiat(4000, .1, 23, year, month1, month2, month3, 173, 181);
            var info_Bahar_Fori_PROP88 = db.spZarfiat(1500, .1, 23, year, month1, month2, month3, 173, 181);
            var info_Bahar_Fori_PROP291 = db.spZarfiat(2500, .1, 23, year, month1, month2, month3, 173, 181);


            double sum_Bahar_Fori_PROP_87 = 0;
            double sum_Bahar_Fori_PROP_290 = 0;
            double sum_Bahar_Fori_PROP_88 = 0;
            double sum_Bahar_Fori_PROP_291 = 0;

            try
            {
                sum_Bahar_Fori_PROP_87 += info_Bahar_Fori_PROP87.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_PROP_290 += info_Bahar_Fori_PROP290.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_PROP_88 += info_Bahar_Fori_PROP88.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_PROP_291 += info_Bahar_Fori_PROP291.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------

            //----------------------------سند چشک انداز PROPOZAL  فوری ----------------------------------------------------
            var info_Bahar_Fori_PROP87_2 = db.spZarfiat(3000, .1, 23, year, month1, month2, month3, 173, 179);
            var info_Bahar_Fori_PROP290_2 = db.spZarfiat(4000, .1, 23, year, month1, month2, month3, 173, 179);
            var info_Bahar_Fori_PROP88_2 = db.spZarfiat(1500, .1, 23, year, month1, month2, month3, 173, 179);
            var info_Bahar_Fori_PROP291_2 = db.spZarfiat(2500, .1, 23, year, month1, month2, month3, 173, 179);



            try
            {
                sum_Bahar_Fori_PROP_87 += info_Bahar_Fori_PROP87_2.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_PROP_290 += info_Bahar_Fori_PROP290_2.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_PROP_88 += info_Bahar_Fori_PROP88_2.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_PROP_291 += info_Bahar_Fori_PROP291_2.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------

            //----------------------------فرم تغییرات PROPOZAL  فوری ----------------------------------------------------
            var info_Bahar_Fori_PROP87_3 = db.spZarfiat(500, 0, 5, year, month1, month2, month3, 173, 178);
            var info_Bahar_Fori_PROP290_3 = db.spZarfiat(500, 0, 5, year, month1, month2, month3, 173, 178);
            var info_Bahar_Fori_PROP88_3 = db.spZarfiat(500, 0, 5, year, month1, month2, month3, 173, 178);
            var info_Bahar_Fori_PROP291_3 = db.spZarfiat(500, 0, 5, year, month1, month2, month3, 173, 178);



            try
            {
                sum_Bahar_Fori_PROP_87 += info_Bahar_Fori_PROP87_3.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_PROP_290 += info_Bahar_Fori_PROP290_3.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_PROP_88 += info_Bahar_Fori_PROP88_3.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_PROP_291 += info_Bahar_Fori_PROP291_3.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------


            //----------------------------مصوب هیات مدیره PROPOZAL  متوسط ----------------------------------------------------
            var info_Bahar_M_PROP87 = db.spZarfiat(3000, .1, 53, year, month1, month2, month3, 174, 181);
            var info_Bahar_M_PROP290 = db.spZarfiat(4000, .1, 53, year, month1, month2, month3, 174, 181);
            var info_Bahar_M_PROP88 = db.spZarfiat(1500, .1, 53, year, month1, month2, month3, 174, 181);
            var info_Bahar_M_PROP291 = db.spZarfiat(2500, .1, 53, year, month1, month2, month3, 174, 181);


            double sum_Bahar_M_PROP_87 = 0;
            double sum_Bahar_M_PROP_290 = 0;
            double sum_Bahar_M_PROP_88 = 0;
            double sum_Bahar_M_PROP_291 = 0;

            try
            {
                sum_Bahar_M_PROP_87 += info_Bahar_M_PROP87.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_PROP_290 += info_Bahar_M_PROP290.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_PROP_88 += info_Bahar_M_PROP88.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_PROP_291 += info_Bahar_M_PROP291.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------


            //----------------------------سند چشم انداز PROPOZAL  متوسط ----------------------------------------------------
            var info_Bahar_M_PROP87_2 = db.spZarfiat(3000, .1, 53, year, month1, month2, month3, 174, 179);
            var info_Bahar_M_PROP290_2 = db.spZarfiat(4000, .1, 53, year, month1, month2, month3, 174, 179);
            var info_Bahar_M_PROP88_2 = db.spZarfiat(1500, .1, 53, year, month1, month2, month3, 174, 179);
            var info_Bahar_M_PROP291_2 = db.spZarfiat(2500, .1, 53, year, month1, month2, month3, 174, 179);

            try
            {
                sum_Bahar_M_PROP_87 += info_Bahar_M_PROP87_2.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_PROP_290 += info_Bahar_M_PROP290_2.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_PROP_88 += info_Bahar_M_PROP88_2.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_PROP_291 += info_Bahar_M_PROP291_2.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------

            //----------------------------فرم تغییرات PROPOZAL  متوسط ----------------------------------------------------
            var info_Bahar_M_PROP87_3 = db.spZarfiat(500, 0, 10, year, month1, month2, month3, 174, 178);
            var info_Bahar_M_PROP290_3 = db.spZarfiat(500, 0, 10, year, month1, month2, month3, 174, 178);
            var info_Bahar_M_PROP88_3 = db.spZarfiat(500, 0, 10, year, month1, month2, month3, 174, 178);
            var info_Bahar_M_PROP291_3 = db.spZarfiat(500, 0, 10, year, month1, month2, month3, 174, 178);

            try
            {
                sum_Bahar_M_PROP_87 += info_Bahar_M_PROP87_3.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_PROP_290 += info_Bahar_M_PROP290_3.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_PROP_88 += info_Bahar_M_PROP88_3.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_PROP_291 += info_Bahar_M_PROP291_3.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------



            //----------------------------مصوب هیات مدیره propozal  عادی ----------------------------------------------------
            var info_Bahar_A_PROP87 = db.spZarfiat(3000, .1, 68, year, month1, month2, month3, 175, 181);
            var info_Bahar_A_PROP290 = db.spZarfiat(4000, .1, 68, year, month1, month2, month3, 175, 181);
            var info_Bahar_A_PROP88 = db.spZarfiat(1500, .1, 68, year, month1, month2, month3, 175, 181);
            var info_Bahar_A_PROP291 = db.spZarfiat(2500, .1, 68, year, month1, month2, month3, 175, 181);


            double sum_Bahar_A_PROP_87 = 0;
            double sum_Bahar_A_PROP_290 = 0;
            double sum_Bahar_A_PROP_88 = 0;
            double sum_Bahar_A_PROP_291 = 0;

            try
            {
                sum_Bahar_A_PROP_87 += info_Bahar_A_PROP87.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_PROP_290 += info_Bahar_A_PROP290.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_PROP_88 += info_Bahar_A_PROP88.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_PROP_291 += info_Bahar_A_PROP291.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------


            //----------------------------سند چشم انداز propozal  عادی ----------------------------------------------------
            var info_Bahar_A_PROP87_2 = db.spZarfiat(3000, .1, 68, year, month1, month2, month3, 175, 179);
            var info_Bahar_A_PROP290_2 = db.spZarfiat(4000, .1, 68, year, month1, month2, month3, 175, 179);
            var info_Bahar_A_PROP88_2 = db.spZarfiat(1500, .1, 68, year, month1, month2, month3, 175, 179);
            var info_Bahar_A_PROP291_2 = db.spZarfiat(2500, .1, 68, year, month1, month2, month3, 175, 179);



            try
            {
                sum_Bahar_A_PROP_87 += info_Bahar_A_PROP87_2.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_PROP_290 += info_Bahar_A_PROP290_2.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_PROP_88 += info_Bahar_A_PROP88_2.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_PROP_291 += info_Bahar_A_PROP291_2.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------


            //----------------------------فرم تغییرات propozal  عادی ----------------------------------------------------
            var info_Bahar_A_PROP87_3 = db.spZarfiat(500, 0, 15, year, month1, month2, month3, 175, 178);
            var info_Bahar_A_PROP290_3 = db.spZarfiat(500, 0, 15, year, month1, month2, month3, 175, 178);
            var info_Bahar_A_PROP88_3 = db.spZarfiat(500, 0, 15, year, month1, month2, month3, 175, 178);
            var info_Bahar_A_PROP291_3 = db.spZarfiat(500, 0, 15, year, month1, month2, month3, 175, 178);



            try
            {
                sum_Bahar_A_PROP_87 += info_Bahar_A_PROP87_3.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_PROP_290 += info_Bahar_A_PROP290_3.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_PROP_88 += info_Bahar_A_PROP88_3.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_PROP_291 += info_Bahar_A_PROP291_3.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------




            //----------------------------مصوب هیات مدیره PROTO  فوری ----------------------------------------------------
            var info_Bahar_Fori_PROT87 = db.spZarfiat(3000, .2, 43, year, month1, month2, month3, 173, 181);
            var info_Bahar_Fori_PROT290 = db.spZarfiat(4000, .2, 43, year, month1, month2, month3, 173, 181);
            var info_Bahar_Fori_PROT88 = db.spZarfiat(1500, .2, 43, year, month1, month2, month3, 173, 181);
            var info_Bahar_Fori_PROT291 = db.spZarfiat(2500, .2, 43, year, month1, month2, month3, 173, 181);


            double sum_Bahar_Fori_PROT_87 = 0;
            double sum_Bahar_Fori_PROT_290 = 0;
            double sum_Bahar_Fori_PROT_88 = 0;
            double sum_Bahar_Fori_PROT_291 = 0;

            try
            {
                sum_Bahar_Fori_PROT_87 += info_Bahar_Fori_PROT87.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_PROT_290 += info_Bahar_Fori_PROT290.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_PROT_88 += info_Bahar_Fori_PROT88.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_PROT_291 += info_Bahar_Fori_PROT291.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------


            //----------------------------سند چشک انداز PROTO  فوری ----------------------------------------------------
            var info_Bahar_Fori_PROT87_2 = db.spZarfiat(3000, .2, 43, year, month1, month2, month3, 173, 179);
            var info_Bahar_Fori_PROT290_2 = db.spZarfiat(4000, .2, 43, year, month1, month2, month3, 173, 179);
            var info_Bahar_Fori_PROT88_2 = db.spZarfiat(1500, .2, 43, year, month1, month2, month3, 173, 179);
            var info_Bahar_Fori_PROT291_2 = db.spZarfiat(2500, .2, 43, year, month1, month2, month3, 173, 179);


            try
            {
                sum_Bahar_Fori_PROT_87 += info_Bahar_Fori_PROT87_2.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_PROT_290 += info_Bahar_Fori_PROT290_2.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_PROT_88 += info_Bahar_Fori_PROT88_2.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_PROT_291 += info_Bahar_Fori_PROT291_2.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------

            //----------------------------فرم تغییرات PROTO  فوری ----------------------------------------------------
            var info_Bahar_Fori_PROT87_3 = db.spZarfiat(500, .3, 10, year, month1, month2, month3, 173, 178);
            var info_Bahar_Fori_PROT290_3 = db.spZarfiat(500, .3, 10, year, month1, month2, month3, 173, 178);
            var info_Bahar_Fori_PROT88_3 = db.spZarfiat(500, .3, 10, year, month1, month2, month3, 173, 178);
            var info_Bahar_Fori_PROT291_3 = db.spZarfiat(500, .3, 10, year, month1, month2, month3, 173, 178);


            try
            {
                sum_Bahar_Fori_PROT_87 += info_Bahar_Fori_PROT87_3.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_PROT_290 += info_Bahar_Fori_PROT290_3.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_PROT_88 += info_Bahar_Fori_PROT88_3.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_PROT_291 += info_Bahar_Fori_PROT291_3.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------




            //----------------------------مصوب هیات مدیره PROTO  متوسط ----------------------------------------------------
            var info_Bahar_M_PROT87 = db.spZarfiat(3000, .2, 83, year, month1, month2, month3, 174, 181);
            var info_Bahar_M_PROT290 = db.spZarfiat(4000, .2, 83, year, month1, month2, month3, 174, 181);
            var info_Bahar_M_PROT88 = db.spZarfiat(1500, .2, 83, year, month1, month2, month3, 174, 181);
            var info_Bahar_M_PROT291 = db.spZarfiat(2500, .2, 83, year, month1, month2, month3, 174, 181);


            double sum_Bahar_M_PROT_87 = 0;
            double sum_Bahar_M_PROT_290 = 0;
            double sum_Bahar_M_PROT_88 = 0;
            double sum_Bahar_M_PROT_291 = 0;

            try
            {
                sum_Bahar_M_PROT_87 += info_Bahar_M_PROT87.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_PROT_290 += info_Bahar_M_PROT290.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_PROT_88 += info_Bahar_M_PROT88.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_PROT_291 += info_Bahar_M_PROT291.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------


            //----------------------------سند چشم انداز PROTO  متوسط ----------------------------------------------------
            var info_Bahar_M_PROT87_2 = db.spZarfiat(3000, .2, 83, year, month1, month2, month3, 174, 179);
            var info_Bahar_M_PROT290_2 = db.spZarfiat(4000, .2, 83, year, month1, month2, month3, 174, 179);
            var info_Bahar_M_PROT88_2 = db.spZarfiat(1500, .2, 83, year, month1, month2, month3, 174, 179);
            var info_Bahar_M_PROT291_2 = db.spZarfiat(2500, .2, 83, year, month1, month2, month3, 174, 179);



            try
            {
                sum_Bahar_M_PROT_87 += info_Bahar_M_PROT87_2.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_PROT_290 += info_Bahar_M_PROT290_2.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_PROT_88 += info_Bahar_M_PROT88_2.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_PROT_291 += info_Bahar_M_PROT291_2.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------


            //----------------------------فرم تغییرات PROTO  متوسط ----------------------------------------------------
            var info_Bahar_M_PROT87_3 = db.spZarfiat(500, .3, 20, year, month1, month2, month3, 174, 178);
            var info_Bahar_M_PROT290_3 = db.spZarfiat(500, .3, 20, year, month1, month2, month3, 174, 178);
            var info_Bahar_M_PROT88_3 = db.spZarfiat(500, .3, 20, year, month1, month2, month3, 174, 178);
            var info_Bahar_M_PROT291_3 = db.spZarfiat(500, .3, 20, year, month1, month2, month3, 174, 178);



            try
            {
                sum_Bahar_M_PROT_87 += info_Bahar_M_PROT87_3.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_PROT_290 += info_Bahar_M_PROT290_3.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_PROT_88 += info_Bahar_M_PROT88_3.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_PROT_291 += info_Bahar_M_PROT291_3.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------




            //----------------------------مصوب هیات مدیره PROTO  عادی ----------------------------------------------------
            var info_Bahar_A_PROTO87 = db.spZarfiat(3000, .2, 98, year, month1, month2, month3, 175, 181);
            var info_Bahar_A_PROTO290 = db.spZarfiat(4000, .2, 98, year, month1, month2, month3, 175, 181);
            var info_Bahar_A_PROTO88 = db.spZarfiat(1500, .2, 98, year, month1, month2, month3, 175, 181);
            var info_Bahar_A_PROTO291 = db.spZarfiat(2500, .2, 98, year, month1, month2, month3, 175, 181);


            double sum_Bahar_A_PROTO_87 = 0;
            double sum_Bahar_A_PROTO_290 = 0;
            double sum_Bahar_A_PROTO_88 = 0;
            double sum_Bahar_A_PROTO_291 = 0;

            try
            {
                sum_Bahar_A_PROTO_87 += info_Bahar_A_PROTO87.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_PROTO_290 += info_Bahar_A_PROTO290.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_PROTO_88 += info_Bahar_A_PROTO88.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_PROTO_291 += info_Bahar_A_PROTO291.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------


            //----------------------------سند چشم انداز PROTO  عادی ----------------------------------------------------
            var info_Bahar_A_PROTO87_2 = db.spZarfiat(3000, .2, 98, year, month1, month2, month3, 175, 179);
            var info_Bahar_A_PROTO290_2 = db.spZarfiat(4000, .2, 98, year, month1, month2, month3, 175, 179);
            var info_Bahar_A_PROTO88_2 = db.spZarfiat(1500, .2, 98, year, month1, month2, month3, 175, 179);
            var info_Bahar_A_PROTO291_2 = db.spZarfiat(2500, .2, 98, year, month1, month2, month3, 175, 179);


            try
            {
                sum_Bahar_A_PROTO_87 += info_Bahar_A_PROTO87_2.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_PROTO_290 += info_Bahar_A_PROTO290_2.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_PROTO_88 += info_Bahar_A_PROTO88_2.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_PROTO_291 += info_Bahar_A_PROTO291_2.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------



            //----------------------------فرم تغییرات PROTO  عادی ----------------------------------------------------
            var info_Bahar_A_PROTO87_3 = db.spZarfiat(500, .3, 30, year, month1, month2, month3, 175, 178);
            var info_Bahar_A_PROTO290_3 = db.spZarfiat(500, .3, 30, year, month1, month2, month3, 175, 178);
            var info_Bahar_A_PROTO88_3 = db.spZarfiat(500, .3, 30, year, month1, month2, month3, 175, 178);
            var info_Bahar_A_PROTO291_3 = db.spZarfiat(500, .3, 30, year, month1, month2, month3, 175, 178);


            try
            {
                sum_Bahar_A_PROTO_87 += info_Bahar_A_PROTO87_3.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_PROTO_290 += info_Bahar_A_PROTO290_3.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_PROTO_88 += info_Bahar_A_PROTO88_3.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_PROTO_291 += info_Bahar_A_PROTO291_3.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------

            //---------------------------- طراحی و تولید  فوری-  مصوب هیات مدیره ----------------------------------------------------
            var info_Bahar_Fori_TT87 = db.spZarfiat(3000, .45, 88, year, month1, month2, month3, 173, 181);
            var info_Bahar_Fori_TT290 = db.spZarfiat(4000, .45, 88, year, month1, month2, month3, 173, 181);
            var info_Bahar_Fori_TT88 = db.spZarfiat(1500, .45, 88, year, month1, month2, month3, 173, 181);
            var info_Bahar_Fori_TT291 = db.spZarfiat(2500, .45, 88, year, month1, month2, month3, 173, 181);


            double sum_Bahar_Fori_TT_87 = 0;
            double sum_Bahar_Fori_TT_290 = 0;
            double sum_Bahar_Fori_TT_88 = 0;
            double sum_Bahar_Fori_TT_291 = 0;

            try
            {
                sum_Bahar_Fori_TT_87 += info_Bahar_Fori_TT87.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_TT_290 += info_Bahar_Fori_TT290.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_TT_88 += info_Bahar_Fori_TT88.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_TT_291 += info_Bahar_Fori_TT291.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------

            //---------------------------- طراحی و تولید  فوری-  سند چشم انداز ----------------------------------------------------
            var info_Bahar_Fori_TT87_2 = db.spZarfiat(3000, .45, 88, year, month1, month2, month3, 173, 179);
            var info_Bahar_Fori_TT290_2 = db.spZarfiat(4000, .45, 88, year, month1, month2, month3, 173, 179);
            var info_Bahar_Fori_TT88_2 = db.spZarfiat(1500, .45, 88, year, month1, month2, month3, 173, 179);
            var info_Bahar_Fori_TT291_2 = db.spZarfiat(2500, .45, 88, year, month1, month2, month3, 173, 179);



            try
            {
                sum_Bahar_Fori_TT_87 += info_Bahar_Fori_TT87_2.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_TT_290 += info_Bahar_Fori_TT290_2.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_TT_88 += info_Bahar_Fori_TT88_2.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_TT_291 += info_Bahar_Fori_TT291_2.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------


            //---------------------------- طراحی و تولید  فوری-  فرم تغییرات ----------------------------------------------------
            var info_Bahar_Fori_TT87_3 = db.spZarfiat(500, .45, 45, year, month1, month2, month3, 173, 178);
            var info_Bahar_Fori_TT290_3 = db.spZarfiat(500, .45, 45, year, month1, month2, month3, 173, 178);
            var info_Bahar_Fori_TT88_3 = db.spZarfiat(500, .45, 45, year, month1, month2, month3, 173, 178);
            var info_Bahar_Fori_TT291_3 = db.spZarfiat(500, .45, 45, year, month1, month2, month3, 173, 178);



            try
            {
                sum_Bahar_Fori_TT_87 += info_Bahar_Fori_TT87_3.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_TT_290 += info_Bahar_Fori_TT290_3.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_TT_88 += info_Bahar_Fori_TT88_3.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_TT_291 += info_Bahar_Fori_TT291_3.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------




            //----------------------------- طراحی و تولید  متوسط  - مصوب هیات مدیره-----------------------------------------------

            var info_Bahar_M_TT87 = db.spZarfiat(3000, .45, 143, year, month1, month2, month3, 174, 181);
            var info_Bahar_M_TT290 = db.spZarfiat(4000, .45, 143, year, month1, month2, month3, 174, 181);
            var info_Bahar_M_TT88 = db.spZarfiat(1500, .45, 143, year, month1, month2, month3, 174, 181);
            var info_Bahar_M_TT291 = db.spZarfiat(2500, .45, 143, year, month1, month2, month3, 174, 181);


            double sum_Bahar_M_TT_87 = 0;
            double sum_Bahar_M_TT_290 = 0;
            double sum_Bahar_M_TT_88 = 0;
            double sum_Bahar_M_TT_291 = 0;

            try
            {
                sum_Bahar_M_TT_87 += info_Bahar_M_TT87.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_TT_290 += info_Bahar_M_TT290.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_TT_88 += info_Bahar_M_TT88.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_TT_291 += info_Bahar_M_TT291.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------


            //----------------------------- طراحی و تولید  متوسط  - سند چشم انداز-----------------------------------------------

            var info_Bahar_M_TT87_2 = db.spZarfiat(3000, .45, 143, year, month1, month2, month3, 174, 179);
            var info_Bahar_M_TT290_2 = db.spZarfiat(4000, .45, 143, year, month1, month2, month3, 174, 179);
            var info_Bahar_M_TT88_2 = db.spZarfiat(1500, .45, 143, year, month1, month2, month3, 174, 179);
            var info_Bahar_M_TT291_2 = db.spZarfiat(2500, .45, 143, year, month1, month2, month3, 174, 179);


            try
            {
                sum_Bahar_M_TT_87 += info_Bahar_M_TT87_2.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_TT_290 += info_Bahar_M_TT290_2.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_TT_88 += info_Bahar_M_TT88_2.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_TT_291 += info_Bahar_M_TT291_2.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------


            //----------------------------- طراحی و تولید  متوسط  -فرم تغییرات-----------------------------------------------

            var info_Bahar_M_TT87_3 = db.spZarfiat(500, .45, 90, year, month1, month2, month3, 174, 178);
            var info_Bahar_M_TT290_3 = db.spZarfiat(500, .45, 90, year, month1, month2, month3, 174, 178);
            var info_Bahar_M_TT88_3 = db.spZarfiat(500, .45, 90, year, month1, month2, month3, 174, 178);
            var info_Bahar_M_TT291_3 = db.spZarfiat(500, .45, 90, year, month1, month2, month3, 174, 178);


            try
            {
                sum_Bahar_M_TT_87 += info_Bahar_M_TT87_3.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_TT_290 += info_Bahar_M_TT290_3.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_TT_88 += info_Bahar_M_TT88_3.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_TT_291 += info_Bahar_M_TT291_3.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------





            //----------------------------- طراحی و تولید  عادی - مصوب هیات مدیره----------------------------------------------------
            var info_Bahar_A_TT87 = db.spZarfiat(3000, .45, 188, year, month1, month2, month3, 175, 181);
            var info_Bahar_A_TT290 = db.spZarfiat(4000, .45, 188, year, month1, month2, month3, 175, 181);
            var info_Bahar_A_TT88 = db.spZarfiat(1500, .45, 188, year, month1, month2, month3, 175, 181);
            var info_Bahar_A_TT291 = db.spZarfiat(2500, .45, 188, year, month1, month2, month3, 175, 181);


            double sum_Bahar_A_TT_87 = 0;
            double sum_Bahar_A_TT_290 = 0;
            double sum_Bahar_A_TT_88 = 0;
            double sum_Bahar_A_TT_291 = 0;

            try
            {
                sum_Bahar_A_TT_87 += info_Bahar_A_TT87.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_TT_290 += info_Bahar_A_TT290.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_TT_88 += info_Bahar_A_TT88.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_TT_291 += info_Bahar_A_TT291.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------


            //----------------------------- طراحی و تولید  عادی - سند چشم انداز----------------------------------------------------
            var info_Bahar_A_TT87_2 = db.spZarfiat(3000, .45, 188, year, month1, month2, month3, 175, 179);
            var info_Bahar_A_TT290_2 = db.spZarfiat(4000, .45, 188, year, month1, month2, month3, 175, 179);
            var info_Bahar_A_TT88_2 = db.spZarfiat(1500, .45, 188, year, month1, month2, month3, 175, 179);
            var info_Bahar_A_TT291_2 = db.spZarfiat(2500, .45, 188, year, month1, month2, month3, 175, 179);



            try
            {
                sum_Bahar_A_TT_87 += info_Bahar_A_TT87_2.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_TT_290 += info_Bahar_A_TT290_2.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_TT_88 += info_Bahar_A_TT88_2.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_TT_291 += info_Bahar_A_TT291_2.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------


            //----------------------------- طراحی و تولید  عادی - فرم تغییرات----------------------------------------------------
            var info_Bahar_A_TT87_3 = db.spZarfiat(500, .45, 135, year, month1, month2, month3, 175, 178);
            var info_Bahar_A_TT290_3 = db.spZarfiat(500, .45, 135, year, month1, month2, month3, 175, 178);
            var info_Bahar_A_TT88_3 = db.spZarfiat(500, .45, 135, year, month1, month2, month3, 175, 178);
            var info_Bahar_A_TT291_3 = db.spZarfiat(500, .45, 135, year, month1, month2, month3, 175, 178);



            try
            {
                sum_Bahar_A_TT_87 += info_Bahar_A_TT87_3.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_TT_290 += info_Bahar_A_TT290_3.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_TT_88 += info_Bahar_A_TT88_3.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_TT_291 += info_Bahar_A_TT291_3.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------




            //----------------------------lمصوب هیات مدیره ALFA  فوری ----------------------------------------------------

            var info_Bahar_Fori_ALFA87 = db.spZarfiat(3000, .1, 103, year, month1, month2, month3, 173, 181);
            var info_Bahar_Fori_ALFA290 = db.spZarfiat(4000, .1, 103, year, month1, month2, month3, 173, 181);
            var info_Bahar_Fori_ALFA88 = db.spZarfiat(1500, .1, 103, year, month1, month2, month3, 173, 181);
            var info_Bahar_Fori_ALFA291 = db.spZarfiat(2500, .1, 103, year, month1, month2, month3, 173, 181);


            double sum_Bahar_Fori_ALFA_87 = 0;
            double sum_Bahar_Fori_ALFA_290 = 0;
            double sum_Bahar_Fori_ALFA_88 = 0;
            double sum_Bahar_Fori_ALFA_291 = 0;

            try
            {
                sum_Bahar_Fori_ALFA_87 += info_Bahar_Fori_ALFA87.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_ALFA_290 += info_Bahar_Fori_ALFA290.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_ALFA_88 += info_Bahar_Fori_ALFA88.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_ALFA_291 += info_Bahar_Fori_ALFA291.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------

            //----------------------------سند چشم انداز ALFA  فوری ----------------------------------------------------

            var info_Bahar_Fori_ALFA87_2 = db.spZarfiat(3000, .1, 103, year, month1, month2, month3, 173, 179);
            var info_Bahar_Fori_ALFA290_2 = db.spZarfiat(4000, .1, 103, year, month1, month2, month3, 173, 179);
            var info_Bahar_Fori_ALFA88_2 = db.spZarfiat(1500, .1, 103, year, month1, month2, month3, 173, 179);
            var info_Bahar_Fori_ALFA291_2 = db.spZarfiat(2500, .1, 103, year, month1, month2, month3, 173, 179);



            try
            {
                sum_Bahar_Fori_ALFA_87 += info_Bahar_Fori_ALFA87_2.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_ALFA_290 += info_Bahar_Fori_ALFA290_2.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_ALFA_88 += info_Bahar_Fori_ALFA88_2.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_ALFA_291 += info_Bahar_Fori_ALFA291_2.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------


            //----------------------------فرم تغییرات ALFA  فوری ----------------------------------------------------

            var info_Bahar_Fori_ALFA87_3 = db.spZarfiat(500, .1, 55, year, month1, month2, month3, 173, 178);
            var info_Bahar_Fori_ALFA290_3 = db.spZarfiat(500, .1, 55, year, month1, month2, month3, 173, 178);
            var info_Bahar_Fori_ALFA88_3 = db.spZarfiat(500, .1, 55, year, month1, month2, month3, 173, 178);
            var info_Bahar_Fori_ALFA291_3 = db.spZarfiat(500, .1, 55, year, month1, month2, month3, 173, 178);



            try
            {
                sum_Bahar_Fori_ALFA_87 += info_Bahar_Fori_ALFA87_3.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_ALFA_290 += info_Bahar_Fori_ALFA290_3.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_ALFA_88 += info_Bahar_Fori_ALFA88_3.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_ALFA_291 += info_Bahar_Fori_ALFA291_3.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------



            //----------------------------مصوب هیات مدیره ALFA  متوسط ----------------------------------------------------

            var info_Bahar_M_ALFA87 = db.spZarfiat(3000, .1, 163, year, month1, month2, month3, 174, 181);
            var info_Bahar_M_ALFA290 = db.spZarfiat(4000, .1, 163, year, month1, month2, month3, 174, 181);
            var info_Bahar_M_ALFA88 = db.spZarfiat(1500, .1, 163, year, month1, month2, month3, 174, 181);
            var info_Bahar_M_ALFA291 = db.spZarfiat(2500, .1, 163, year, month1, month2, month3, 174, 181);


            double sum_Bahar_M_ALFA_87 = 0;
            double sum_Bahar_M_ALFA_290 = 0;
            double sum_Bahar_M_ALFA_88 = 0;
            double sum_Bahar_M_ALFA_291 = 0;

            try
            {
                sum_Bahar_M_ALFA_87 += info_Bahar_M_ALFA87.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_ALFA_290 += info_Bahar_M_ALFA290.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_ALFA_88 += info_Bahar_M_ALFA88.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_ALFA_291 += info_Bahar_M_ALFA291.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------

            //----------------------------سند چشم انداز ALFA  متوسط ----------------------------------------------------

            var info_Bahar_M_ALFA87_2 = db.spZarfiat(3000, .1, 163, year, month1, month2, month3, 174, 179);
            var info_Bahar_M_ALFA290_2 = db.spZarfiat(4000, .1, 163, year, month1, month2, month3, 174, 179);
            var info_Bahar_M_ALFA88_2 = db.spZarfiat(1500, .1, 163, year, month1, month2, month3, 174, 179);
            var info_Bahar_M_ALFA291_2 = db.spZarfiat(2500, .1, 163, year, month1, month2, month3, 174, 179);



            try
            {
                sum_Bahar_M_ALFA_87 += info_Bahar_M_ALFA87_2.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_ALFA_290 += info_Bahar_M_ALFA290_2.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_ALFA_88 += info_Bahar_M_ALFA88_2.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_ALFA_291 += info_Bahar_M_ALFA291_2.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------

            //----------------------------فرم تغییرات ALFA  متوسط ----------------------------------------------------

            var info_Bahar_M_ALFA87_3 = db.spZarfiat(500, .1, 110, year, month1, month2, month3, 174, 178);
            var info_Bahar_M_ALFA290_3 = db.spZarfiat(500, .1, 110, year, month1, month2, month3, 174, 178);
            var info_Bahar_M_ALFA88_3 = db.spZarfiat(500, .1, 110, year, month1, month2, month3, 174, 178);
            var info_Bahar_M_ALFA291_3 = db.spZarfiat(500, .1, 110, year, month1, month2, month3, 174, 178);



            try
            {
                sum_Bahar_M_ALFA_87 += info_Bahar_M_ALFA87_3.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_ALFA_290 += info_Bahar_M_ALFA290_3.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_ALFA_88 += info_Bahar_M_ALFA88_3.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_ALFA_291 += info_Bahar_M_ALFA291_3.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------



            //----------------------------مصوب هیات مدیره ALFA  عادی ----------------------------------------------------

            var info_Bahar_A_ALFA87 = db.spZarfiat(3000, .1, 233, year, month1, month2, month3, 175, 181);
            var info_Bahar_A_ALFA290 = db.spZarfiat(4000, .1, 233, year, month1, month2, month3, 175, 181);
            var info_Bahar_A_ALFA88 = db.spZarfiat(1500, .1, 233, year, month1, month2, month3, 175, 181);
            var info_Bahar_A_ALFA291 = db.spZarfiat(2500, .1, 233, year, month1, month2, month3, 175, 181);


            double sum_Bahar_A_ALFA_87 = 0;
            double sum_Bahar_A_ALFA_290 = 0;
            double sum_Bahar_A_ALFA_88 = 0;
            double sum_Bahar_A_ALFA_291 = 0;

            try
            {
                sum_Bahar_A_ALFA_87 += info_Bahar_A_ALFA87.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_ALFA_290 += info_Bahar_A_ALFA290.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_ALFA_88 += info_Bahar_A_ALFA88.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_ALFA_291 += info_Bahar_A_ALFA291.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------


            //----------------------------سند چشم انداز ALFA  عادی ----------------------------------------------------

            var info_Bahar_A_ALFA87_2 = db.spZarfiat(3000, .1, 233, year, month1, month2, month3, 175, 179);
            var info_Bahar_A_ALFA290_2 = db.spZarfiat(4000, .1, 233, year, month1, month2, month3, 175, 179);
            var info_Bahar_A_ALFA88_2 = db.spZarfiat(1500, .1, 233, year, month1, month2, month3, 175, 179);
            var info_Bahar_A_ALFA291_2 = db.spZarfiat(2500, .1, 233, year, month1, month2, month3, 175, 179);


            try
            {
                sum_Bahar_A_ALFA_87 += info_Bahar_A_ALFA87_2.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_ALFA_290 += info_Bahar_A_ALFA290_2.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_ALFA_88 += info_Bahar_A_ALFA88_2.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_ALFA_291 += info_Bahar_A_ALFA291_2.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------


            //----------------------------فرم تغییرات ALFA  عادی ----------------------------------------------------

            var info_Bahar_A_ALFA87_3 = db.spZarfiat(500, .1, 165, year, month1, month2, month3, 175, 178);
            var info_Bahar_A_ALFA290_3 = db.spZarfiat(500, .1, 165, year, month1, month2, month3, 175, 178);
            var info_Bahar_A_ALFA88_3 = db.spZarfiat(500, .1, 165, year, month1, month2, month3, 175, 178);
            var info_Bahar_A_ALFA291_3 = db.spZarfiat(500, .1, 165, year, month1, month2, month3, 175, 178);


            try
            {
                sum_Bahar_A_ALFA_87 += info_Bahar_A_ALFA87_3.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_ALFA_290 += info_Bahar_A_ALFA290_3.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_ALFA_88 += info_Bahar_A_ALFA88_3.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_ALFA_291 += info_Bahar_A_ALFA291_3.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------



            //----------------------------  تحویل  فوری - مصوب هیات مدیره----------------------------------------------------

            var info_Bahar_Fori_TAH87 = db.spZarfiat(3000, .05, 113, year, month1, month2, month3, 173, 181);
            var info_Bahar_Fori_TAH290 = db.spZarfiat(4000, .05, 113, year, month1, month2, month3, 173, 181);
            var info_Bahar_Fori_TAH88 = db.spZarfiat(1500, .05, 113, year, month1, month2, month3, 173, 181);
            var info_Bahar_Fori_TAH291 = db.spZarfiat(2500, .05, 113, year, month1, month2, month3, 173, 181);


            double sum_Bahar_Fori_TAH_87 = 0;
            double sum_Bahar_Fori_TAH_290 = 0;
            double sum_Bahar_Fori_TAH_88 = 0;
            double sum_Bahar_Fori_TAH_291 = 0;

            try
            {
                sum_Bahar_Fori_TAH_87 += info_Bahar_Fori_TAH87.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_TAH_290 += info_Bahar_Fori_TAH290.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_TAH_88 += info_Bahar_Fori_TAH88.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_TAH_291 += info_Bahar_Fori_TAH291.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------


            //----------------------------  تحویل  فوری - سند چشم انداز----------------------------------------------------

            var info_Bahar_Fori_TAH87_2 = db.spZarfiat(3000, .05, 113, year, month1, month2, month3, 173, 179);
            var info_Bahar_Fori_TAH290_2 = db.spZarfiat(4000, .05, 113, year, month1, month2, month3, 173, 179);
            var info_Bahar_Fori_TAH88_2 = db.spZarfiat(1500, .05, 113, year, month1, month2, month3, 173, 179);
            var info_Bahar_Fori_TAH291_2 = db.spZarfiat(2500, .05, 113, year, month1, month2, month3, 173, 179);



            try
            {
                sum_Bahar_Fori_TAH_87 += info_Bahar_Fori_TAH87_2.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_TAH_290 += info_Bahar_Fori_TAH290_2.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_TAH_88 += info_Bahar_Fori_TAH88_2.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_TAH_291 += info_Bahar_Fori_TAH291_2.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------


            //----------------------------  تحویل  فوری - فرم تغییرات----------------------------------------------------

            var info_Bahar_Fori_TAH87_3 = db.spZarfiat(500, .05, 60, year, month1, month2, month3, 173, 178);
            var info_Bahar_Fori_TAH290_3 = db.spZarfiat(500, .05, 60, year, month1, month2, month3, 173, 178);
            var info_Bahar_Fori_TAH88_3 = db.spZarfiat(500, .05, 60, year, month1, month2, month3, 173, 178);
            var info_Bahar_Fori_TAH291_3 = db.spZarfiat(500, .05, 60, year, month1, month2, month3, 173, 178);



            try
            {
                sum_Bahar_Fori_TAH_87 += info_Bahar_Fori_TAH87_3.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_TAH_290 += info_Bahar_Fori_TAH290_3.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_TAH_88 += info_Bahar_Fori_TAH88_3.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_Fori_TAH_291 += info_Bahar_Fori_TAH291_3.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------



            //---------------------------- تحویل  متوسط مصوب هیات مدیره----------------------------------------------------

            var info_Bahar_M_TAH87 = db.spZarfiat(3000, .05, 173, year, month1, month2, month3, 174, 181);
            var info_Bahar_M_TAH290 = db.spZarfiat(4000, .05, 173, year, month1, month2, month3, 174, 181);
            var info_Bahar_M_TAH88 = db.spZarfiat(1500, .05, 173, year, month1, month2, month3, 174, 181);
            var info_Bahar_M_TAH291 = db.spZarfiat(2500, .05, 173, year, month1, month2, month3, 174, 181);


            double sum_Bahar_M_TAH_87 = 0;
            double sum_Bahar_M_TAH_290 = 0;
            double sum_Bahar_M_TAH_88 = 0;
            double sum_Bahar_M_TAH_291 = 0;

            try
            {
                sum_Bahar_M_TAH_87 += info_Bahar_M_TAH87.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_TAH_290 += info_Bahar_M_TAH290.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_TAH_88 += info_Bahar_M_TAH88.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_TAH_291 += info_Bahar_M_TAH291.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------


            //---------------------------- تحویل  متوسط سند چشم انداز----------------------------------------------------

            var info_Bahar_M_TAH87_2 = db.spZarfiat(3000, .05, 173, year, month1, month2, month3, 174, 179);
            var info_Bahar_M_TAH290_2 = db.spZarfiat(4000, .05, 173, year, month1, month2, month3, 174, 179);
            var info_Bahar_M_TAH88_2 = db.spZarfiat(1500, .05, 173, year, month1, month2, month3, 174, 179);
            var info_Bahar_M_TAH291_2 = db.spZarfiat(2500, .05, 173, year, month1, month2, month3, 174, 179);



            try
            {
                sum_Bahar_M_TAH_87 += info_Bahar_M_TAH87_2.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_TAH_290 += info_Bahar_M_TAH290_2.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_TAH_88 += info_Bahar_M_TAH88_2.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_TAH_291 += info_Bahar_M_TAH291_2.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------


            //---------------------------- تحویل  متوسط فرم تغییرات----------------------------------------------------

            var info_Bahar_M_TAH87_3 = db.spZarfiat(500, .05, 120, year, month1, month2, month3, 174, 178);
            var info_Bahar_M_TAH290_3 = db.spZarfiat(500, .05, 120, year, month1, month2, month3, 174, 178);
            var info_Bahar_M_TAH88_3 = db.spZarfiat(500, .05, 120, year, month1, month2, month3, 174, 178);
            var info_Bahar_M_TAH291_3 = db.spZarfiat(500, .05, 120, year, month1, month2, month3, 174, 178);



            try
            {
                sum_Bahar_M_TAH_87 += info_Bahar_M_TAH87_3.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_TAH_290 += info_Bahar_M_TAH290_3.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_TAH_88 += info_Bahar_M_TAH88_3.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_M_TAH_291 += info_Bahar_M_TAH291_3.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------



            //--------------------------- تحویل  عادی مصوب هیات مدیره----------------------------------------------------

            var info_Bahar_A_TAH87 = db.spZarfiat(3000, .05, 248, year, month1, month2, month3, 175, 181);
            var info_Bahar_A_TAH290 = db.spZarfiat(4000, .05, 248, year, month1, month2, month3, 175, 181);
            var info_Bahar_A_TAH88 = db.spZarfiat(1500, .05, 248, year, month1, month2, month3, 175, 181);
            var info_Bahar_A_TAH291 = db.spZarfiat(2500, .05, 248, year, month1, month2, month3, 175, 181);


            double sum_Bahar_A_TAH_87 = 0;
            double sum_Bahar_A_TAH_290 = 0;
            double sum_Bahar_A_TAH_88 = 0;
            double sum_Bahar_A_TAH_291 = 0;

            try
            {
                sum_Bahar_A_TAH_87 += info_Bahar_A_TAH87.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_TAH_290 += info_Bahar_A_TAH290.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_TAH_88 += info_Bahar_A_TAH88.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_TAH_291 += info_Bahar_A_TAH291.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------


            //--------------------------- تحویل  عادی سند چشم انداز----------------------------------------------------

            var info_Bahar_A_TAH87_2 = db.spZarfiat(3000, .05, 248, year, month1, month2, month3, 175, 179);
            var info_Bahar_A_TAH290_2 = db.spZarfiat(4000, .05, 248, year, month1, month2, month3, 175, 179);
            var info_Bahar_A_TAH88_2 = db.spZarfiat(1500, .05, 248, year, month1, month2, month3, 175, 179);
            var info_Bahar_A_TAH291_2 = db.spZarfiat(2500, .05, 248, year, month1, month2, month3, 175, 179);


            try
            {
                sum_Bahar_A_TAH_87 += info_Bahar_A_TAH87_2.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_TAH_290 += info_Bahar_A_TAH290_2.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_TAH_88 += info_Bahar_A_TAH88_2.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_TAH_291 += info_Bahar_A_TAH291_2.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------


            //--------------------------- تحویل  عادی فرم تغییرات----------------------------------------------------

            var info_Bahar_A_TAH87_3 = db.spZarfiat(500, .05, 180, year, month1, month2, month3, 175, 178);
            var info_Bahar_A_TAH290_3 = db.spZarfiat(500, .05, 180, year, month1, month2, month3, 175, 178);
            var info_Bahar_A_TAH88_3 = db.spZarfiat(500, .05, 180, year, month1, month2, month3, 175, 178);
            var info_Bahar_A_TAH291_3 = db.spZarfiat(500, .05, 180, year, month1, month2, month3, 175, 178);


            try
            {
                sum_Bahar_A_TAH_87 += info_Bahar_A_TAH87_3.Where(n => n.prProjectType == 87).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_TAH_290 += info_Bahar_A_TAH290_3.Where(n => n.prProjectType == 290).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_TAH_88 += info_Bahar_A_TAH88_3.Where(n => n.prProjectType == 88 || n.prProjectType == 204).Sum(n => n.sums).Value;
            }
            catch { }

            try
            {
                sum_Bahar_A_TAH_291 += info_Bahar_A_TAH291_3.Where(n => n.prProjectType == 291).Sum(n => n.sums).Value;
            }
            catch { }

            //-------------------------------------------------------------------------------------------------------------------------








            var sum87 = sum_Bahar_Fori_SRS_87 + sum_Bahar_M_SRS_87 + sum_Bahar_A_SRS_87 + sum_Bahar_Fori_PROP_87 + sum_Bahar_M_PROP_87 +
                sum_Bahar_A_PROP_87 + sum_Bahar_Fori_PROT_87 + sum_Bahar_M_PROT_87 + sum_Bahar_A_PROTO_87 + sum_Bahar_Fori_TT_87 + sum_Bahar_M_TT_87 + sum_Bahar_A_TT_87 + sum_Bahar_Fori_ALFA_87 + sum_Bahar_M_ALFA_87 + sum_Bahar_A_ALFA_87 + sum_Bahar_Fori_TAH_87 + sum_Bahar_M_TAH_87 + sum_Bahar_A_TAH_87;


            var sum290 = sum_Bahar_Fori_SRS_290 + sum_Bahar_M_SRS_290 + sum_Bahar_A_SRS_290 + sum_Bahar_Fori_PROP_290 + sum_Bahar_M_PROP_290 + sum_Bahar_A_PROP_290 + sum_Bahar_Fori_PROT_290 + sum_Bahar_M_PROT_290 + sum_Bahar_A_PROTO_290 + sum_Bahar_Fori_TT_290 + sum_Bahar_M_TT_290 + sum_Bahar_A_TT_290 + sum_Bahar_Fori_ALFA_290 + sum_Bahar_M_ALFA_290 + sum_Bahar_A_ALFA_290 + sum_Bahar_Fori_TAH_290 + sum_Bahar_M_TAH_290 + sum_Bahar_A_TAH_290;

            var sum88 = sum_Bahar_Fori_SRS_88 + sum_Bahar_M_SRS_88 + sum_Bahar_A_SRS_88 + sum_Bahar_Fori_PROP_88 + sum_Bahar_M_PROP_88 + sum_Bahar_A_PROP_88 + sum_Bahar_Fori_PROT_88 + sum_Bahar_M_PROT_88 + sum_Bahar_A_PROTO_88 + sum_Bahar_Fori_TT_88 + sum_Bahar_M_TT_88 + sum_Bahar_A_TT_88 + sum_Bahar_Fori_ALFA_88 + sum_Bahar_M_ALFA_88 + sum_Bahar_A_ALFA_88 + sum_Bahar_Fori_TAH_88 + sum_Bahar_M_TAH_88 + sum_Bahar_A_TAH_88;


            var sum291 = sum_Bahar_Fori_SRS_291 + sum_Bahar_M_SRS_291 + sum_Bahar_A_SRS_291 + sum_Bahar_Fori_PROP_291 + sum_Bahar_M_PROP_291 + sum_Bahar_A_PROP_291 + sum_Bahar_Fori_PROT_291 + sum_Bahar_M_PROT_291 + sum_Bahar_A_PROTO_291 + sum_Bahar_Fori_TT_291 + sum_Bahar_M_TT_291 + sum_Bahar_A_TT_291 + sum_Bahar_Fori_ALFA_291 + sum_Bahar_M_ALFA_291 + sum_Bahar_A_ALFA_291 + sum_Bahar_Fori_TAH_291 + sum_Bahar_M_TAH_291 + sum_Bahar_A_TAH_291;


            if (year == 1397)
            {
                if (month1 == "01")
                {
                    r2197.Value = Convert.ToInt64(sum87).ToString();
                    r2297.Value = Convert.ToInt64(sum290).ToString();
                    r2397.Value = Convert.ToInt64(sum88).ToString();
                    r2497.Value = Convert.ToInt64(sum291).ToString();
                }

                if (month1 == "04")
                {
                    r2597.Value = Convert.ToInt64(sum87).ToString();
                    r2697.Value = Convert.ToInt64(sum290).ToString();
                    r2797.Value = Convert.ToInt64(sum88).ToString();
                    r2897.Value = Convert.ToInt64(sum291).ToString();
                }

                if (month1 == "07")
                {
                    r2997.Value = Convert.ToInt64(sum87).ToString();
                    r29a97.Value = Convert.ToInt64(sum290).ToString();
                    r29b97.Value = Convert.ToInt64(sum88).ToString();
                    r29c97.Value = Convert.ToInt64(sum291).ToString();
                }

                if (month1 == "10")
                {
                    r29d97.Value = Convert.ToInt64(sum87).ToString();
                    r29e97.Value = Convert.ToInt64(sum290).ToString();
                    r29f97.Value = Convert.ToInt64(sum88).ToString();
                    r29g97.Value = Convert.ToInt64(sum291).ToString();
                }
            }

            if (year == 1396)
            {
                if (month1 == "01")
                {
                    r21.Value = Convert.ToInt64(sum87).ToString();
                    r22.Value = Convert.ToInt64(sum290).ToString();
                    r23.Value = Convert.ToInt64(sum88).ToString();
                    r24.Value = Convert.ToInt64(sum291).ToString();
                }

                if (month1 == "04")
                {
                    r25.Value = Convert.ToInt64(sum87).ToString();
                    r26.Value = Convert.ToInt64(sum290).ToString();
                    r27.Value = Convert.ToInt64(sum88).ToString();
                    r28.Value = Convert.ToInt64(sum291).ToString();
                }

                if (month1 == "07")
                {
                    r29.Value = Convert.ToInt64(sum87).ToString();
                    r29a.Value = Convert.ToInt64(sum290).ToString();
                    r29b.Value = Convert.ToInt64(sum88).ToString();
                    r29c.Value = Convert.ToInt64(sum291).ToString();
                }

                if (month1 == "10")
                {
                    r29d.Value = Convert.ToInt64(sum87).ToString();
                    r29e.Value = Convert.ToInt64(sum290).ToString();
                    r29f.Value = Convert.ToInt64(sum88).ToString();
                    r29g.Value = Convert.ToInt64(sum291).ToString();
                }
            }

            else if (year == 1395)
            {
                if (month1 == "01")
                {
                    r51.Value = Convert.ToInt64(sum87).ToString();
                    r52.Value = Convert.ToInt64(sum290).ToString();
                    r53.Value = Convert.ToInt64(sum88).ToString();
                    r54.Value = Convert.ToInt64(sum291).ToString();
                }

                if (month1 == "04")
                {
                    r55.Value = Convert.ToInt64(sum87).ToString();
                    r56.Value = Convert.ToInt64(sum290).ToString();
                    r57.Value = Convert.ToInt64(sum88).ToString();
                    r58.Value = Convert.ToInt64(sum291).ToString();
                }

                if (month1 == "07")
                {
                    r59.Value = Convert.ToInt64(sum87).ToString();
                    r5a.Value = Convert.ToInt64(sum290).ToString();
                    r5b.Value = Convert.ToInt64(sum88).ToString();
                    r5c.Value = Convert.ToInt64(sum291).ToString();
                }

                if (month1 == "10")
                {
                    r5d.Value = Convert.ToInt64(sum87).ToString();
                    r5e.Value = Convert.ToInt64(sum290).ToString();
                    r5f.Value = Convert.ToInt64(sum88).ToString();
                    r5g.Value = Convert.ToInt64(sum291).ToString();
                }
            }

            else if (year == 1394)
            {
                if (month1 == "01")
                {
                    r81.Value = Convert.ToInt64(sum87).ToString();
                    r82.Value = Convert.ToInt64(sum290).ToString();
                    r83.Value = Convert.ToInt64(sum88).ToString();
                    r84.Value = Convert.ToInt64(sum291).ToString();
                }

                if (month1 == "04")
                {
                    r85.Value = Convert.ToInt64(sum87).ToString();
                    r86.Value = Convert.ToInt64(sum290).ToString();
                    r87.Value = Convert.ToInt64(sum88).ToString();
                    r88.Value = Convert.ToInt64(sum291).ToString();
                }

                if (month1 == "07")
                {
                    r89.Value = Convert.ToInt64(sum87).ToString();
                    r8a.Value = Convert.ToInt64(sum290).ToString();
                    r8b.Value = Convert.ToInt64(sum88).ToString();
                    r8c.Value = Convert.ToInt64(sum291).ToString();
                }

                if (month1 == "10")
                {
                    r8d.Value = Convert.ToInt64(sum87).ToString();
                    r8e.Value = Convert.ToInt64(sum290).ToString();
                    r8f.Value = Convert.ToInt64(sum88).ToString();
                    r8g.Value = Convert.ToInt64(sum291).ToString();
                }
            }


            else if (year == 1393)
            {
                if (month1 == "01")
                {
                    r111.Value = Convert.ToInt64(sum87).ToString();
                    r112.Value = Convert.ToInt64(sum290).ToString();
                    r113.Value = Convert.ToInt64(sum88).ToString();
                    r114.Value = Convert.ToInt64(sum291).ToString();
                }

                if (month1 == "04")
                {
                    r115.Value = Convert.ToInt64(sum87).ToString();
                    r116.Value = Convert.ToInt64(sum290).ToString();
                    r117.Value = Convert.ToInt64(sum88).ToString();
                    r118.Value = Convert.ToInt64(sum291).ToString();
                }

                if (month1 == "07")
                {
                    r119.Value = Convert.ToInt64(sum87).ToString();
                    r11a.Value = Convert.ToInt64(sum290).ToString();
                    r11b.Value = Convert.ToInt64(sum88).ToString();
                    r11c.Value = Convert.ToInt64(sum291).ToString();
                }

                if (month1 == "10")
                {
                    r11d.Value = Convert.ToInt64(sum87).ToString();
                    r11e.Value = Convert.ToInt64(sum290).ToString();
                    r11f.Value = Convert.ToInt64(sum88).ToString();
                    r11g.Value = Convert.ToInt64(sum291).ToString();
                }
            }




        }


        void loadNafar()
        {
            r1197.Value = Convert.ToInt64(hajm87 * Nafar87).ToString();
            r1297.Value = Convert.ToInt64(hajm290 * Nafar290).ToString();
            r1397.Value = Convert.ToInt64(hajm88 * Nafar88).ToString();
            r1497.Value = Convert.ToInt64(hajm291 * Nafar291).ToString();


            r1597.Value = Convert.ToInt64(hajm87 * Nafar87).ToString();
            r1697.Value = Convert.ToInt64(hajm290 * Nafar290).ToString();
            r1797.Value = Convert.ToInt64(hajm88 * Nafar88).ToString();
            r1897.Value = Convert.ToInt64(hajm291 * Nafar291).ToString();



            r1997.Value = Convert.ToInt64(hajm87 * Nafar87).ToString();
            r1a97.Value = Convert.ToInt64(hajm290 * Nafar290).ToString();
            r1b97.Value = Convert.ToInt64(hajm88 * Nafar88).ToString();
            r1c97.Value = Convert.ToInt64(hajm291 * Nafar291).ToString();



            r1d97.Value = Convert.ToInt64(hajm87 * Nafar87).ToString();
            r1e97.Value = Convert.ToInt64(hajm290 * Nafar290).ToString();
            r1f97.Value = Convert.ToInt64(hajm88 * Nafar88).ToString();
            r1g97.Value = Convert.ToInt64(hajm291 * Nafar291).ToString();


            //----

            r11.Value = Convert.ToInt64(hajm87 * Nafar87).ToString();
            r12.Value = Convert.ToInt64(hajm290 * Nafar290).ToString();
            r13.Value = Convert.ToInt64(hajm88 * Nafar88).ToString();
            r14.Value = Convert.ToInt64(hajm291 * Nafar291).ToString();


            r15.Value = Convert.ToInt64(hajm87 * Nafar87).ToString();
            r16.Value = Convert.ToInt64(hajm290 * Nafar290).ToString();
            r17.Value = Convert.ToInt64(hajm88 * Nafar88).ToString();
            r18.Value = Convert.ToInt64(hajm291 * Nafar291).ToString();



            r19.Value = Convert.ToInt64(hajm87 * Nafar87).ToString();
            r1a.Value = Convert.ToInt64(hajm290 * Nafar290).ToString();
            r1b.Value = Convert.ToInt64(hajm88 * Nafar88).ToString();
            r1c.Value = Convert.ToInt64(hajm291 * Nafar291).ToString();



            r1d.Value = Convert.ToInt64(hajm87 * Nafar87).ToString();
            r1e.Value = Convert.ToInt64(hajm290 * Nafar290).ToString();
            r1f.Value = Convert.ToInt64(hajm88 * Nafar88).ToString();
            r1g.Value = Convert.ToInt64(hajm291 * Nafar291).ToString();


            //----

            r41.Value = Convert.ToInt64(hajm87 * Nafar87).ToString();
            r42.Value = Convert.ToInt64(hajm290 * Nafar290).ToString();
            r43.Value = Convert.ToInt64(hajm88 * Nafar88).ToString();
            r44.Value = Convert.ToInt64(hajm291 * Nafar291).ToString();

            r45.Value = Convert.ToInt64(hajm87 * Nafar87).ToString();
            r46.Value = Convert.ToInt64(hajm290 * Nafar290).ToString();
            r47.Value = Convert.ToInt64(hajm88 * Nafar88).ToString();
            r48.Value = Convert.ToInt64(hajm291 * Nafar291).ToString();



            r49.Value = Convert.ToInt64(hajm87 * Nafar87).ToString();
            r4a.Value = Convert.ToInt64(hajm290 * Nafar290).ToString();
            r4b.Value = Convert.ToInt64(hajm88 * Nafar88).ToString();
            r4c.Value = Convert.ToInt64(hajm291 * Nafar291).ToString();



            r4d.Value = Convert.ToInt64(hajm87 * Nafar87).ToString();
            r4e.Value = Convert.ToInt64(hajm290 * Nafar290).ToString();
            r4f.Value = Convert.ToInt64(hajm88 * Nafar88).ToString();
            r4g.Value = Convert.ToInt64(hajm291 * Nafar291).ToString();


            //----

            r71.Value = Convert.ToInt64(hajm87 * Nafar87).ToString();
            r72.Value = Convert.ToInt64(hajm290 * Nafar290).ToString();
            r73.Value = Convert.ToInt64(hajm88 * Nafar88).ToString();
            r74.Value = Convert.ToInt64(hajm291 * Nafar291).ToString();

            r75.Value = Convert.ToInt64(hajm87 * Nafar87).ToString();
            r76.Value = Convert.ToInt64(hajm290 * Nafar290).ToString();
            r77.Value = Convert.ToInt64(hajm88 * Nafar88).ToString();
            r78.Value = Convert.ToInt64(hajm291 * Nafar291).ToString();



            r79.Value = Convert.ToInt64(hajm87 * Nafar87).ToString();
            r7a.Value = Convert.ToInt64(hajm290 * Nafar290).ToString();
            r7b.Value = Convert.ToInt64(hajm88 * Nafar88).ToString();
            r7c.Value = Convert.ToInt64(hajm291 * Nafar291).ToString();



            r7d.Value = Convert.ToInt64(hajm87 * Nafar87).ToString();
            r7e.Value = Convert.ToInt64(hajm290 * Nafar290).ToString();
            r7f.Value = Convert.ToInt64(hajm88 * Nafar88).ToString();
            r7g.Value = Convert.ToInt64(hajm291 * Nafar291).ToString();


            //----

            r101.Value = Convert.ToInt64(hajm87 * Nafar87).ToString();
            r102.Value = Convert.ToInt64(hajm290 * Nafar290).ToString();
            r103.Value = Convert.ToInt64(hajm88 * Nafar88).ToString();
            r104.Value = Convert.ToInt64(hajm291 * Nafar291).ToString();

            r105.Value = Convert.ToInt64(hajm87 * Nafar87).ToString();
            r106.Value = Convert.ToInt64(hajm290 * Nafar290).ToString();
            r107.Value = Convert.ToInt64(hajm88 * Nafar88).ToString();
            r108.Value = Convert.ToInt64(hajm291 * Nafar291).ToString();



            r109.Value = Convert.ToInt64(hajm87 * Nafar87).ToString();
            r10a.Value = Convert.ToInt64(hajm290 * Nafar290).ToString();
            r10b.Value = Convert.ToInt64(hajm88 * Nafar88).ToString();
            r10c.Value = Convert.ToInt64(hajm291 * Nafar291).ToString();



            r10d.Value = Convert.ToInt64(hajm87 * Nafar87).ToString();
            r10e.Value = Convert.ToInt64(hajm290 * Nafar290).ToString();
            r10f.Value = Convert.ToInt64(hajm88 * Nafar88).ToString();
            r10g.Value = Convert.ToInt64(hajm291 * Nafar291).ToString();

        }


        void loadKasr()
        {
            r3197.Value = (Convert.ToInt64(r1197.Value) - Convert.ToInt64(r2197.Value)).ToString();
            r3297.Value = (Convert.ToInt64(r1297.Value) - Convert.ToInt64(r2297.Value)).ToString();
            r3397.Value = (Convert.ToInt64(r1397.Value) - Convert.ToInt64(r2397.Value)).ToString();
            r3497.Value = (Convert.ToInt64(r1497.Value) - Convert.ToInt64(r2497.Value)).ToString();
                                                                             
            r3597.Value = (Convert.ToInt64(r1597.Value) - Convert.ToInt64(r2597.Value)).ToString();
            r3697.Value = (Convert.ToInt64(r1697.Value) - Convert.ToInt64(r2697.Value)).ToString();
            r3797.Value = (Convert.ToInt64(r1797.Value) - Convert.ToInt64(r2797.Value)).ToString();
            r3897.Value = (Convert.ToInt64(r1897.Value) - Convert.ToInt64(r2897.Value)).ToString();
                                                                            
            r3997.Value = (Convert.ToInt64(r1997.Value) - Convert.ToInt64(r2997.Value)).ToString();
            r3a97.Value = (Convert.ToInt64(r1a97.Value) - Convert.ToInt64(r29a97.Value)).ToString();
            r3b97.Value = (Convert.ToInt64(r1b97.Value) - Convert.ToInt64(r29b97.Value)).ToString();
            r3c97.Value = (Convert.ToInt64(r1c97.Value) - Convert.ToInt64(r29c97.Value)).ToString();
                                                                            
            r3d97.Value = (Convert.ToInt64(r1d97.Value) - Convert.ToInt64(r29d97.Value)).ToString();
            r3e97.Value = (Convert.ToInt64(r1e97.Value) - Convert.ToInt64(r29e97.Value)).ToString();
            r3f97.Value = (Convert.ToInt64(r1f97.Value) - Convert.ToInt64(r29f97.Value)).ToString();
            r3g97.Value = (Convert.ToInt64(r1g97.Value) - Convert.ToInt64(r29g97.Value)).ToString();
              

            //----
            

            r31.Value = (Convert.ToInt64(r11.Value) - Convert.ToInt64(r21.Value)).ToString();
            r32.Value = (Convert.ToInt64(r12.Value) - Convert.ToInt64(r22.Value)).ToString();
            r33.Value = (Convert.ToInt64(r13.Value) - Convert.ToInt64(r23.Value)).ToString();
            r34.Value = (Convert.ToInt64(r14.Value) - Convert.ToInt64(r24.Value)).ToString();

            r35.Value = (Convert.ToInt64(r15.Value) - Convert.ToInt64(r25.Value)).ToString();
            r36.Value = (Convert.ToInt64(r16.Value) - Convert.ToInt64(r26.Value)).ToString();
            r37.Value = (Convert.ToInt64(r17.Value) - Convert.ToInt64(r27.Value)).ToString();
            r38.Value = (Convert.ToInt64(r18.Value) - Convert.ToInt64(r28.Value)).ToString();

            r39.Value = (Convert.ToInt64(r19.Value) - Convert.ToInt64(r29.Value)).ToString();
            r3a.Value = (Convert.ToInt64(r1a.Value) - Convert.ToInt64(r29a.Value)).ToString();
            r3b.Value = (Convert.ToInt64(r1b.Value) - Convert.ToInt64(r29b.Value)).ToString();
            r3c.Value = (Convert.ToInt64(r1c.Value) - Convert.ToInt64(r29c.Value)).ToString();


            r3d.Value = (Convert.ToInt64(r1d.Value) - Convert.ToInt64(r29d.Value)).ToString();
            r3e.Value = (Convert.ToInt64(r1e.Value) - Convert.ToInt64(r29e.Value)).ToString();
            r3f.Value = (Convert.ToInt64(r1f.Value) - Convert.ToInt64(r29f.Value)).ToString();
            r3g.Value = (Convert.ToInt64(r1g.Value) - Convert.ToInt64(r29g.Value)).ToString();



            //----
            r61.Value = (Convert.ToInt64(r41.Value) - Convert.ToInt64(r51.Value)).ToString();
            r62.Value = (Convert.ToInt64(r42.Value) - Convert.ToInt64(r52.Value)).ToString();
            r63.Value = (Convert.ToInt64(r43.Value) - Convert.ToInt64(r53.Value)).ToString();
            r64.Value = (Convert.ToInt64(r44.Value) - Convert.ToInt64(r54.Value)).ToString();

            r65.Value = (Convert.ToInt64(r45.Value) - Convert.ToInt64(r55.Value)).ToString();
            r66.Value = (Convert.ToInt64(r46.Value) - Convert.ToInt64(r56.Value)).ToString();
            r67.Value = (Convert.ToInt64(r47.Value) - Convert.ToInt64(r57.Value)).ToString();
            r68.Value = (Convert.ToInt64(r48.Value) - Convert.ToInt64(r58.Value)).ToString();

            r69.Value = (Convert.ToInt64(r49.Value) - Convert.ToInt64(r59.Value)).ToString();
            r6a.Value = (Convert.ToInt64(r4a.Value) - Convert.ToInt64(r5a.Value)).ToString();
            r6b.Value = (Convert.ToInt64(r4b.Value) - Convert.ToInt64(r5b.Value)).ToString();
            r6c.Value = (Convert.ToInt64(r4c.Value) - Convert.ToInt64(r5c.Value)).ToString();


            r6d.Value = (Convert.ToInt64(r4d.Value) - Convert.ToInt64(r5d.Value)).ToString();
            r6e.Value = (Convert.ToInt64(r4e.Value) - Convert.ToInt64(r5e.Value)).ToString();
            r6f.Value = (Convert.ToInt64(r4f.Value) - Convert.ToInt64(r5f.Value)).ToString();
            r6g.Value = (Convert.ToInt64(r4g.Value) - Convert.ToInt64(r5g.Value)).ToString();


            //----
            r91.Value = (Convert.ToInt64(r71.Value) - Convert.ToInt64(r81.Value)).ToString();
            r92.Value = (Convert.ToInt64(r72.Value) - Convert.ToInt64(r82.Value)).ToString();
            r93.Value = (Convert.ToInt64(r73.Value) - Convert.ToInt64(r83.Value)).ToString();
            r94.Value = (Convert.ToInt64(r74.Value) - Convert.ToInt64(r84.Value)).ToString();

            r95.Value = (Convert.ToInt64(r75.Value) - Convert.ToInt64(r85.Value)).ToString();
            r96.Value = (Convert.ToInt64(r76.Value) - Convert.ToInt64(r86.Value)).ToString();
            r97.Value = (Convert.ToInt64(r77.Value) - Convert.ToInt64(r87.Value)).ToString();
            r98.Value = (Convert.ToInt64(r78.Value) - Convert.ToInt64(r88.Value)).ToString();

            r99.Value = (Convert.ToInt64(r79.Value) - Convert.ToInt64(r89.Value)).ToString();
            r9a.Value = (Convert.ToInt64(r7a.Value) - Convert.ToInt64(r8a.Value)).ToString();
            r9b.Value = (Convert.ToInt64(r7b.Value) - Convert.ToInt64(r8b.Value)).ToString();
            r9c.Value = (Convert.ToInt64(r7c.Value) - Convert.ToInt64(r8c.Value)).ToString();


            r9d.Value = (Convert.ToInt64(r7d.Value) - Convert.ToInt64(r8d.Value)).ToString();
            r9e.Value = (Convert.ToInt64(r7e.Value) - Convert.ToInt64(r8e.Value)).ToString();
            r9f.Value = (Convert.ToInt64(r7f.Value) - Convert.ToInt64(r8f.Value)).ToString();
            r9g.Value = (Convert.ToInt64(r7g.Value) - Convert.ToInt64(r8g.Value)).ToString();

            //----
            r121.Value = (Convert.ToInt64(r101.Value) - Convert.ToInt64(r111.Value)).ToString();
            r122.Value = (Convert.ToInt64(r102.Value) - Convert.ToInt64(r112.Value)).ToString();
            r123.Value = (Convert.ToInt64(r103.Value) - Convert.ToInt64(r113.Value)).ToString();
            r124.Value = (Convert.ToInt64(r104.Value) - Convert.ToInt64(r114.Value)).ToString();

            r125.Value = (Convert.ToInt64(r105.Value) - Convert.ToInt64(r115.Value)).ToString();
            r126.Value = (Convert.ToInt64(r106.Value) - Convert.ToInt64(r116.Value)).ToString();
            r127.Value = (Convert.ToInt64(r107.Value) - Convert.ToInt64(r117.Value)).ToString();
            r128.Value = (Convert.ToInt64(r108.Value) - Convert.ToInt64(r118.Value)).ToString();

            r12c.Value = (Convert.ToInt64(r109.Value) - Convert.ToInt64(r119.Value)).ToString();
            r12a.Value = (Convert.ToInt64(r10a.Value) - Convert.ToInt64(r11a.Value)).ToString();
            r12b.Value = (Convert.ToInt64(r10b.Value) - Convert.ToInt64(r11b.Value)).ToString();
            r12c.Value = (Convert.ToInt64(r10c.Value) - Convert.ToInt64(r11c.Value)).ToString();


            r12d.Value = (Convert.ToInt64(r7d.Value) - Convert.ToInt64(r11d.Value)).ToString();
            r12e.Value = (Convert.ToInt64(r7e.Value) - Convert.ToInt64(r11e.Value)).ToString();
            r12f.Value = (Convert.ToInt64(r7f.Value) - Convert.ToInt64(r11f.Value)).ToString();
            r12g.Value = (Convert.ToInt64(r7g.Value) - Convert.ToInt64(r11g.Value)).ToString();




        }

        protected void Page_Load(object sender, EventArgs e)
        {
            loadNafar();

            loadInfo(1397, "01", "02", "03");
            loadInfo(1397, "04", "05", "06");
            loadInfo(1397, "07", "08", "09");
            loadInfo(1397, "10", "11", "12");

            loadInfo(1396, "01", "02", "03");
            loadInfo(1396, "04", "05", "06");
            loadInfo(1396, "07", "08", "09");
            loadInfo(1396, "10", "11", "12");


            loadInfo(1395, "01", "02", "03");
            loadInfo(1395, "04", "05", "06");
            loadInfo(1395, "07", "08", "09");
            loadInfo(1395, "10", "11", "12");


            loadInfo(1394, "01", "02", "03");
            loadInfo(1394, "04", "05", "06");
            loadInfo(1394, "07", "08", "09");
            loadInfo(1394, "10", "11", "12");



            loadInfo(1393, "01", "02", "03");
            loadInfo(1393, "04", "05", "06");
            loadInfo(1393, "07", "08", "09");
            loadInfo(1393, "10", "11", "12");

            loadKasr();

            //-------------- 96 ---------------------------------------
            int int961 = Convert.ToInt32(r31.Value);
            int int964 = Convert.ToInt32(r35.Value);
            int int967 = Convert.ToInt32(r39.Value);
            int int9610 = Convert.ToInt32(r3d.Value);


            int int962 = Convert.ToInt32(r32.Value);
            int int965 = Convert.ToInt32(r36.Value);
            int int968 = Convert.ToInt32(r3a.Value);
            int int9611 = Convert.ToInt32(r3e.Value);


            int int963 = Convert.ToInt32(r33.Value);
            int int966 = Convert.ToInt32(r37.Value);
            int int969 = Convert.ToInt32(r3b.Value);
            int int9612 = Convert.ToInt32(r3f.Value);


            int int96a = Convert.ToInt32(r34.Value);
            int int96b = Convert.ToInt32(r38.Value);
            int int96c = Convert.ToInt32(r3c.Value);
            int int96d = Convert.ToInt32(r3g.Value);


            //-----  تسهیلات ریالی 1396
            var cht96A = db2.tbCharts.SingleOrDefault(n => n.chId == 100);
            cht96A.chValue = int961;

            var cht96B = db2.tbCharts.SingleOrDefault(n => n.chId == 101);
            cht96B.chValue = int964;

            var cht96C = db2.tbCharts.SingleOrDefault(n => n.chId == 102);
            cht96C.chValue = int967;

            var cht96D = db2.tbCharts.SingleOrDefault(n => n.chId == 103);
            cht96D.chValue = int9610;



            //-----  تسهیلات ارزی 1396
            var cht96E = db2.tbCharts.SingleOrDefault(n => n.chId == 104);
            cht96E.chValue = int962;

            var cht96F = db2.tbCharts.SingleOrDefault(n => n.chId == 105);
            cht96F.chValue = int965;

            var cht96G = db2.tbCharts.SingleOrDefault(n => n.chId == 106);
            cht96G.chValue = int968;

            var cht96H = db2.tbCharts.SingleOrDefault(n => n.chId == 107);
            cht96H.chValue = int9611;




            //-----  سپرده ریالی 1396
            var cht96I = db2.tbCharts.SingleOrDefault(n => n.chId == 108);
            cht96I.chValue = int963;

            var cht96J = db2.tbCharts.SingleOrDefault(n => n.chId == 109);
            cht96J.chValue = int966;

            var cht96K = db2.tbCharts.SingleOrDefault(n => n.chId == 110);
            cht96K.chValue = int969;

            var cht96L = db2.tbCharts.SingleOrDefault(n => n.chId == 111);
            cht96L.chValue = int9612;




            //-----  سپرده ارزی 1396
            var cht96M = db2.tbCharts.SingleOrDefault(n => n.chId == 112);
            cht96M.chValue = int96a;

            var cht96N = db2.tbCharts.SingleOrDefault(n => n.chId == 113);
            cht96N.chValue = int96b;

            var cht96X = db2.tbCharts.SingleOrDefault(n => n.chId == 114);
            cht96X.chValue = int96c;

            var cht96Z = db2.tbCharts.SingleOrDefault(n => n.chId == 115);
            cht96Z.chValue = int96d;


            db2.SaveChanges();

        }
    }
}