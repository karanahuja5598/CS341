using System;  
using System.Collections.Generic;  
using System.Linq;  
using System.Threading.Tasks;  
using Microsoft.AspNetCore.Mvc;  
using Microsoft.AspNetCore.Mvc.RazorPages;  
using System.Data;

namespace program.Pages  
{
    public class Top10Model : PageModel
    {
        public List<Models.Station> StationList { get; set; }
        public Exception EX { get; set; }
        
        public void OnGet()
        {
            StationList = new List<Models.Station>();
            
            EX = null;
            
            try 
            {
                string sql;
                
                sql = string.Format(@"
                SELECT TOP 10 Name, SUM(DailyTotal) AS TotalRidership
                FROM Riderships
                INNER JOIN Stations
                ON Stations.StationID = Riderships.StationID
                GROUP BY Stations.Name
                ORDER BY TotalRidership DESC
                ");
                
                DataSet ds = DataAccessTier.DB.ExecuteNonScalarQuery(sql);
                
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    Models.Station s = new Models.Station();
                    
                    s.StationName = Convert.ToString(row["Name"]);
                    s.TotalRidership = Convert.ToInt32(row["TotalRidership"]);
                    
                    StationList.Add(s);
                }
            }
            catch(Exception ex)
            {
                EX = ex;
            }
            finally
            {
            
            }
        }
    }
}