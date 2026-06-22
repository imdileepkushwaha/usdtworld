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

        public static string ProjectName { get { return "Social Vista"; } }
        public static string ProjectAbbreviation { get { return "Social Vista"; } }
        public static string ProjectWebsite { get { return "https://socialvista/"; } }
        public static string Company { get { return "Social Vista"; } }
        public static string Session { get { return "2026-267"; } }

        public static string Day { get { return DateTime.Now.ToString("ddd, MMM dd, yyyy"); } }

    }

