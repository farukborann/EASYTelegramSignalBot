using System;
using System.Collections.Generic;

namespace EASYTelegramSignalBot.NewsBot.Models
{
    public class Response
    {
        public int count { get; set; }
        public string next { get; set; }
        public object previous { get; set; }
        public List<Result> results { get; set; }
    }

    public class Result
    {
        public string kind { get; set; }
        public string domain { get; set; }
        public Votes votes { get; set; }
        public Source source { get; set; }
        public string title { get; set; }
        public DateTime published_at { get; set; }
        public string slug { get; set; }
        public int id { get; set; }
        public string url { get; set; }
        public DateTime created_at { get; set; }
        public List<Currency> currencies { get; set; }
    }

    public class Votes
    {
        public int negative { get; set; }
        public int positive { get; set; }
        public int important { get; set; }
        public int liked { get; set; }
        public int disliked { get; set; }
        public int lol { get; set; }
        public int toxic { get; set; }
        public int saved { get; set; }
        public int comments { get; set; }
    }

    public class Source
    {
        public string title { get; set; }
        public string region { get; set; }
        public string domain { get; set; }
        public object path { get; set; }
    }

    public class Currency
    {
        public string code { get; set; }
        public string title { get; set; }
        public string slug { get; set; }
        public string url { get; set; }
    }
}



