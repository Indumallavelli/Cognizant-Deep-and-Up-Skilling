using Microsoft.AspNetCore.Mvc;
using EmployeeWebApi.Models;

namespace EmployeeWebApi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class EmployeeController : ControllerBase
    {
        private static List<Employee> employees = GetStandardEmployeeList();

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public ActionResult<List<Employee>> Get()
        {
            return Ok(employees);
        }

        [HttpPost]
        public IActionResult Post([FromBody] Employee employee)
        {
            employees.Add(employee);
            return Ok(employee);
        }

        [HttpPut]
        public ActionResult<Employee> Put([FromBody] Employee employee)
        {
            if (employee.Id <= 0)
            {
                return BadRequest("Invalid employee id");
            }

            var emp = employees.FirstOrDefault(e => e.Id == employee.Id);

            if (emp == null)
            {
                return BadRequest("Invalid employee id");
            }

            emp.Name = employee.Name;
            emp.Salary = employee.Salary;
            emp.Permanent = employee.Permanent;
            emp.Department = employee.Department;
            emp.Skills = employee.Skills;
            emp.DateOfBirth = employee.DateOfBirth;

            return Ok(emp);
        }

        private static List<Employee> GetStandardEmployeeList()
        {
            return new List<Employee>
            {
                new Employee
                {
                    Id = 1,
                    Name = "John",
                    Salary = 50000,
                    Permanent = true,
                    DateOfBirth = new DateTime(1995,5,10),
                    Department = new Department
                    {
                        Id = 1,
                        Name = "IT"
                    },
                    Skills = new List<Skill>
                    {
                        new Skill{ Id=1, Name="C#" },
                        new Skill{ Id=2, Name="ASP.NET Core" }
                    }
                },
                new Employee
                {
                    Id = 2,
                    Name = "David",
                    Salary = 60000,
                    Permanent = false,
                    DateOfBirth = new DateTime(1998,8,20),
                    Department = new Department
                    {
                        Id = 2,
                        Name = "HR"
                    },
                    Skills = new List<Skill>
                    {
                        new Skill{ Id=3, Name="Communication" }
                    }
                }
            };
        }
    }
}