using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Service;
using Restaurant.Core.Enums;
using Restaurant.Service;
using System.Net.Mail;
using Microsoft.ReportingServices.Interfaces;
using Xamarin.Essentials;

namespace Restaurant.WebAPI.Controllers
{
    [Route ("api/[controller]")]
    [ApiController]
    public class NotificationController : ControllerBase
    {
        #region Class Variables
        private SettingsTypeService _settingsTypeSVC = new SettingsTypeService ();

        private NotificationService _notificSVC;

        #endregion
        #region Constructors
        public NotificationController ( )
        {
            _notificSVC = new NotificationService ();
        }

        #endregion
        #region Http Verbs

        [HttpPost]
        public ActionResult Post ( NotificationDE ntfcn )
        {
            _notificSVC.SendEmail (ntfcn);
            return Ok ();
        }
        //[HttpPost ("{Attachment}/{pdfFile}")]
        //public ActionResult UploadPDF ( IFormFile pdfFile , NotificationDE notification)
        //{
        //    try
        //    {
        //        if (pdfFile != null && pdfFile.Length > 0)
        //        {
        //            // You can save the PDF file or process it as needed.
        //            // Example: Save it to a temporary location
        //            var filePath = Path.GetTempFileName ();

        //            using (var stream = new FileStream (filePath, FileMode.Create))
        //            {
        //                pdfFile.CopyTo (stream);
        //            }

        //            // Now, you can send the email with the PDF file as an attachment.
        //            _notificSVC.SendEmailWithAttachment ( pdfFile, notification);

        //            return Ok ("PDF file uploaded and email sent.");
        //        }
        //        return BadRequest ("No PDF file received");
        //    }
        //    catch (Exception)
        //    {
        //        return BadRequest ("No PDF file received");
        //    }
           
        //}
        [HttpPost ("{Attachment}")]
        public ActionResult SendMail ( IFormFile pdfFile, NotificationDE mail )
        {
                    // You can save the PDF file or process it as needed.
                    // Example: Save it to a temporary location
                    //var filePath = Path.GetTempFileName ();

                    //using (var stream = new FileStream (filePath, FileMode.Create))
                    //{
                    //    pdfFile.CopyTo (stream);
                    //}

                    // Now, you can send the email with the PDF file as an attachment.
                    _notificSVC.SendEmailWithAttachment (pdfFile, mail);
            return Ok ();
        }
        [HttpPost ("Mail")]
        public ActionResult Search ( [FromForm]NotificationDE mail  )
        {
            _notificSVC.SendEmailWithAttachment (mail.Attachment, mail);
            return Ok ();
        }
        #endregion
    }
}
