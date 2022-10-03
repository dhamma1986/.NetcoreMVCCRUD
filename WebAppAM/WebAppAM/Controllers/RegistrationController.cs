using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebAppAM.Models;

namespace WebAppAM.Controllers
{
    public class RegistrationController : Controller
    {
        private readonly AgreementContext _Db;

        public RegistrationController (AgreementContext Db)
        {
            _Db = Db;
        }



        public IActionResult Index()
        {
            return View();
        }

        

        public async Task<IActionResult> UserLogin(UserLogin userLogin)
        {
            if (ModelState.IsValid)
            {
                var user = (from usr in _Db.UserMaster
                            where usr.email == userLogin.Email
                            && usr.Password == userLogin.Password
                            select usr).FirstOrDefault();

                if (user != null)
                {
                    HttpContext.Session.SetString("UserID", user.ID.ToString());
                    HttpContext.Session.SetString("Email", user.email);
                    //Session["UserID"] = user.ID;
                    // Session["Email"] = user.email;
                    return RedirectToAction("AgreementList", "Agreement");
                    //return RedirectToAction("AgreementList");
                }
            }

            ModelState.Clear();
            return View();
           
           
            
        }
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(Users users)
        {
            try
            {

                //var errors = ModelState.Values.SelectMany(v => v.Errors);

                if (ModelState.IsValid)
                {

                    _Db.Add(users);
                    await _Db.SaveChangesAsync();
                    return RedirectToAction("UserLogin");

                }
                else
                {
                    return View();
                }
            }
            catch (Exception ex)
            {

                return View();
            }
        }
    }
}
