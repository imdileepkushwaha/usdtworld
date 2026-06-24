using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataTier;
using System.Data;
using System.Data.SqlClient;


    public class clsUtility
    {

        public static string ProjectName { get { return "USDT WORLD"; } }
        public static string ProjectAbbreviation { get { return "USDT WORLD"; } }
        public static string ProjectWebsite { get { return "https://usdtworld.club/"; } }
        public static string Company { get { return "USDT WORLD"; } }
        public static string Session { get { return (DateTime.Now.Year - 1) + "–" + DateTime.Now.Year; } }

        public static string Day { get { return DateTime.Now.ToString("ddd, MMM dd, yyyy"); } }

    }

