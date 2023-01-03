using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Proyecto_POO.Models;
using MySql.Data.MySqlClient;

namespace Proyecto_POO.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }

    public IActionResult Cotizaciones()
    {
        return View();
    }

    public IActionResult Login(){
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
