using AutoMapper;
using Restaurant.Core.Entities;
using Restaurant.Core.Extenstions;
using Restaurant.Core.ViewModel;
using Restaurant.Core.ViewModel.Reports;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Mappers
{
    public class AutoMapperProfile : Profile
    {
        public AutoMapperProfile ( )
        {
            CreateMap<SaleOrderDE, SaleOrderVM> ()
                 .ForMember (dest => dest.date, opt => opt.MapFrom (src => src.CreatedOn.ToDateTimeString ()))
                 .ForMember (dest => dest.billType, opt => opt.MapFrom (src => src.PaymentMethod + (src.Bank != null ? src.Bank : "")))
                 .ForMember (dest => dest.billNo, opt => opt.MapFrom (src => src.Id))
                 .ForMember (dest => dest.customer, opt => opt.MapFrom (src => src.BillTitle))
                 .ForMember (dest => dest.cashOutTime, opt => opt.MapFrom (src => src.ModifiedOn.ToDateTimeString ()))
                 .ForMember (dest => dest.amount, opt => opt.MapFrom (src => src.Total.ToString ()))
                 .ForMember (dest => dest.gst, opt => opt.MapFrom (src => src.GSTValue.ToString ()))
                 .ForMember (dest => dest.discount, opt => opt.MapFrom (src => src.DiscountValue.ToString ()))
                 .ForMember (dest => dest.netAmount, opt => opt.MapFrom (src => src.NetTotal.ToString ()))
                .ReverseMap ();

            CreateMap<ItemDE, RawItemVM> ()
               .ForMember (dest => dest.name, opt => opt.MapFrom (src => src.ItemName))
               .ForMember (dest => dest.price, opt => opt.MapFrom (src => src.Price.ToString()))
               .ForMember (dest => dest.min, opt => opt.MapFrom (src => src.MinOrderLevel != null ? src.MinOrderLevel : 0.ToString ()))
               .ForMember (dest => dest.max, opt => opt.MapFrom (src => src.MaxOrderLevel!=null?src.MaxOrderLevel:0.ToString()))
               .ForMember (dest => dest.difference, opt => opt.MapFrom (src =>
               (src.MinOrderLevel!=null && src.MaxOrderLevel!=null)? (
               int.Parse(src.MaxOrderLevel != null ? src.MaxOrderLevel : 0.ToString ()) -int.Parse(src.MinOrderLevel != null ? src.MinOrderLevel : 0.ToString ())).ToString():0.ToString()))
                .ReverseMap ();

            CreateMap<SaleOrderLineDE, ComplimentaryReportVM> ()
               .ForMember (dest => dest.qty, opt => opt.MapFrom (src => src.QTY.ToString()))
               .ForMember (dest => dest.amount, opt => opt.MapFrom (src => src.Price.ToString ()))
               .ForMember (dest => dest.date, opt => opt.MapFrom (src => src.CreatedOn.ToDateTimeString ()))
               .ForMember (dest => dest.itemName, opt => opt.MapFrom (src => src.ItemName))
               .ForMember (dest => dest.invoiceNo, opt => opt.MapFrom (src => "Inv_"+src.SaleOrderId.ToString()))
                .ReverseMap ();

            CreateMap<SaleDetailRefundDE, SaleRefundReportVM> ()
              .ForMember (dest => dest.qty, opt => opt.MapFrom (src => src.QTY))
              .ForMember (dest => dest.gst, opt => opt.MapFrom (src => src.GST))
              .ForMember (dest => dest.type, opt => opt.MapFrom (src => src.Type))
              .ForMember (dest => dest.reason, opt => opt.MapFrom (src => src.Reason))
              .ForMember (dest => dest.amount, opt => opt.MapFrom (src => src.Price))
              .ForMember (dest => dest.date, opt => opt.MapFrom (src => src.Date.ToDateString ()))
               .ForMember (dest => dest.billTime, opt => opt.MapFrom (src => src.BillTime.ToDateTimeString ()))
              .ForMember (dest => dest.time, opt => opt.MapFrom (src => src.Time))
              .ForMember (dest => dest.itemName, opt => opt.MapFrom (src => src.ItemName))
              .ForMember (dest => dest.invNo, opt => opt.MapFrom (src => "Inv_" + src.SaleOrderId.ToString ()))
               .ReverseMap ();

            CreateMap<SaleOrderLineDE, DiscountSaleReportVM> ()
             .ForMember (dest => dest.qty, opt => opt.MapFrom (src => src.QTY))
             .ForMember (dest => dest.amount, opt => opt.MapFrom (src => src.LineTotal))
             .ForMember (dest => dest.discountType, opt => opt.MapFrom (src =>src.IsComp?"Complimentary": src.DiscountKey))
             .ForMember (dest => dest.discountPer, opt => opt.MapFrom (src => src.DiscountKeyValue))
             .ForMember (dest => dest.billTitle, opt => opt.MapFrom (src => src.BillTitle))
             .ForMember (dest => dest.narration, opt => opt.MapFrom (src => src.ComplimentaryNarration))
             .ForMember (dest => dest.itemName, opt => opt.MapFrom (src => src.ItemName))
              .ReverseMap ();

        }
    }
}
