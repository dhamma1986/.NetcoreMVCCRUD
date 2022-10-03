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
    public class AgreementController : Controller
    {
        private readonly AgreementContext _Db;

        public AgreementController(AgreementContext Db)
        {
            _Db = Db;
        }
        public IActionResult AgreementList()
        {
            try
            {
                var UserID = HttpContext.Session.GetString("UserID");

                if (UserID != null)
                {
                    //var agreementlist = _Db.AgreementMaster.ToList();
                    var agmList = from a in _Db.AgreementMaster
                                  join pg in _Db.ProductGroupMaster
                                  on a.PrdGroupID equals pg.ID
                                  join prd in _Db.ProductMaster
                                  on a.ProductID equals prd.ID
                                  select new Agreement
                                  {
                                      ID = a.ID,
                                      EffectiveDate = a.EffectiveDate,
                                      ExpirationDate = a.ExpirationDate,
                                      ProductPrice = a.ProductPrice,
                                      NewPrice = a.NewPrice,
                                      PrdGroupID = a.PrdGroupID,
                                      ProductID = a.ProductID,

                                      ProductDescription = prd.ProductDescription == null ? "" : prd.ProductDescription,
                                      GroupDescription = pg.GroupDescription == null ? "" : pg.GroupDescription

                                  };

                    return View(agmList);
                }
                 else
                {
                    return RedirectToAction("UserLogin", "Registration");
                }

            }
            catch (Exception ex)
            {

                return View();
            }
            
        }

        public  IActionResult Create(Agreement agreement)
        {
            LoadGroup();
            LoadProduct();
            return View(agreement);
        }

        [HttpPost]
        public async Task<IActionResult> AddAgreement(Agreement agreement)
        {
            try
            {

                //var errors = ModelState.Values.SelectMany(v => v.Errors);

                if (ModelState.IsValid)
                {
                    if(agreement.ID == 0)
                    {
                        _Db.Add(agreement);
                        await _Db.SaveChangesAsync();
                    }
                    else
                    {
                        _Db.Entry(agreement).State = EntityState.Modified;
                        await _Db.SaveChangesAsync();
                    }
                 

                    return RedirectToAction("AgreementList");
                }
                return View();
            }
            catch (Exception ex)
            {

                return RedirectToAction("AgreementList");
            }
        }

        public async Task<IActionResult> DeleteAgreement (long id)
        {
            try
            {
                var ag = await _Db.AgreementMaster.FindAsync(id);
                if(ag != null)
                {
                    _Db.AgreementMaster.Remove(ag);
                    await _Db.SaveChangesAsync();
                }
                return RedirectToAction("AgreementList");
            }
            catch (Exception ex)
            {

                return RedirectToAction("AgreementList");
            }
        }
        private void LoadGroup()
        {
            try
            {
                List<ProductGroup> pg = new List<ProductGroup>();
                pg = _Db.ProductGroupMaster.ToList();

                pg.Insert(0, new ProductGroup { ID = 0, GroupDescription = "Please Select" });

                ViewBag.pgList = pg;
            }
            catch (Exception ex)
            {

                //throw;
            }
        }

        private void LoadProduct()
        {
            try
            {
                List<Product> products = new List<Product>();
                products = _Db.ProductMaster.ToList();

                products.Insert(0, new Product { ID = 0, ProductDescription = "Please Select" });

                ViewBag.productList = products;
            }
            catch (Exception ex)
            {

                //throw;
            }
        }


    }
}
