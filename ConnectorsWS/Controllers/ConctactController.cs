using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ContactService.Controllers
{
    public class ConctactController : Controller
    {
        //
        // GET: /Conctact/

        public ActionResult Index()
        {
            return View();
        }

        // POST api/values
        public ActionResult Post(string myInputData)
        {
            return View();
        }

        //
        // GET: /Conctact/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Conctact/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Conctact/Create

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Conctact/Edit/5

        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Conctact/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Conctact/Delete/5

        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Conctact/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
