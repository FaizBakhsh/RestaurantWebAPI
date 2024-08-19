using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RNController : ControllerBase
    {
        #region Class Variables

        private readonly RNService _RNSVC;

        #endregion

        #region Constructors

        public RNController()
        {
            _RNSVC = new RNService();
        }

        #endregion

        #region Http Verbs

        /// <summary>
        /// Retrieves all RNDE records.
        /// </summary>
        /// <returns>List of RNDE records</returns>
        [HttpGet]
        public async Task<IActionResult> Get()
        {
            try
            {
                RNDE RN = new RNDE();
                List<RNDE> list = await Task.Run(() => _RNSVC.SearchRNs(RN));
                return Ok(list);
            }
            catch (Exception ex)
            {
                // Log exception here
                return StatusCode(500, "Internal server error.");
            }
        }

        /// <summary>
        /// Retrieves a specific RNDE record by ID.
        /// </summary>
        /// <param name="id">ID of the RNDE record</param>
        /// <returns>RNDE record</returns>
        [HttpGet("{id}")]
        public async Task<IActionResult> GetRNById(int id)
        {
            if (id <= 0)
                return BadRequest("Invalid ID.");

            try
            {
                RNDE RN = new RNDE { Id = id };
                List<RNDE> list = await Task.Run(() => _RNSVC.SearchRNs(RN));
                if (list.Count == 0)
                    return NotFound("Record not found.");

                return Ok(list);
            }
            catch (Exception ex)
            {
                // Log exception here
                return StatusCode(500, "Internal server error.");
            }
        }

        /// <summary>
        /// Searches for RNDE records based on provided criteria.
        /// </summary>
        /// <param name="search">Search criteria</param>
        /// <returns>List of RNDE records matching the criteria</returns>
        [HttpPost("Search")]
        public async Task<IActionResult> Search([FromBody] RNDE search)
        {
            if (search == null)
                return BadRequest("Invalid search criteria.");

            try
            {
                List<RNDE> list = await Task.Run(() => _RNSVC.SearchRNs(search));
                return Ok(list);
            }
            catch (Exception ex)
            {
                // Log exception here
                return StatusCode(500, "Internal server error.");
            }
        }

        /// <summary>
        /// Inserts a new RNDE record.
        /// </summary>
        /// <param name="preturn">RNDE record to be inserted</param>
        /// <returns>Inserted RNDE record</returns>
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] RNDE preturn)
        {
            if (preturn == null)
                return BadRequest("Invalid RNDE record.");

            try
            {
                preturn.DBoperation = DBoperations.Insert;
                RNDE RN = await Task.Run(() => _RNSVC.ManagementRN(preturn));
                return CreatedAtAction(nameof(GetRNById), new { id = RN.Id }, RN);
            }
            catch (Exception ex)
            {
                // Log exception here
                return StatusCode(500, "Internal server error.");
            }
        }

        /// <summary>
        /// Updates an existing RNDE record.
        /// </summary>
        /// <param name="preturn">RNDE record to be updated</param>
        /// <returns>Updated RNDE record</returns>
        [HttpPut]
        public async Task<IActionResult> Put([FromBody] RNDE preturn)
        {
            if (preturn == null)
                return BadRequest("Invalid RNDE record.");

            try
            {
                preturn.DBoperation = DBoperations.Update;
                RNDE RN = await Task.Run(() => _RNSVC.ManagementRN(preturn));
                return Ok(RN);
            }
            catch (Exception ex)
            {
                // Log exception here
                return StatusCode(500, "Internal server error.");
            }
        }

        /// <summary>
        /// Deletes an RNDE record by ID.
        /// </summary>
        /// <param name="id">ID of the RNDE record to be deleted</param>
        /// <returns>Result of the delete operation</returns>
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            if (id <= 0)
                return BadRequest("Invalid ID.");

            try
            {
                RNDE preturn = new RNDE { Id = id, DBoperation = DBoperations.Delete };
                RNDE RN = await Task.Run(() => _RNSVC.ManagementRN(preturn));
                return Ok(RN);
            }
            catch (Exception ex)
            {
                // Log exception here
                return StatusCode(500, "Internal server error.");
            }
        }

        #endregion
    }
}
