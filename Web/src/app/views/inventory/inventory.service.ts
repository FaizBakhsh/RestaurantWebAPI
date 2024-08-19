import { KitchenIssuanceVM } from './Models/KitchenIssuanceVM';
import { KitchenDemandVM } from './Models/KitchenDemandVM';
import { StockEstimationVM } from './Models/StockEstimationVM';
import { PurchaseReturnVM } from './Models/PurchaseReturn';
import { InventoryTransferVM } from './Models/InventoryTransfer';
import { CompleteWasteVM } from './Models/CompleteWaste';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { DemandVM } from './Models/DemandVM';
import { Globals } from 'src/app/globals';
import { IssueStockVM } from './Models/IssueStockVM';
import { PurchaseOrderVM } from './Models/PurchaseOrder';
import { PurchaseItemsVM } from './Models/PurchaseItem';
import {RNVM} from './Models/RNVM';
import {RFQVM} from './Models/RfqVM'
@Injectable({
  providedIn: 'root'
})
export class InventoryService {


  constructor(private http: HttpClient,) { }
  UpdateDemand(Demand: DemandVM) {
    return this.http.put(Globals.BASE_API_URL + 'Demand', Demand);
  }
  GetDemandById(id: number): Observable<DemandVM> {

    return this.http.get<DemandVM>(Globals.BASE_API_URL + 'Demand/' + id).pipe()
  }
  SearchDemand(Demand: DemandVM): Observable<DemandVM[]> {
    return this.http.post<DemandVM[]>(Globals.BASE_API_URL + 'Demand/Search', Demand).pipe();
  }
  GetDemand(): Observable<DemandVM[]> {
    return this.http.get<DemandVM[]>(Globals.BASE_API_URL + 'Demand').pipe();
  }
  SaveDemand(Demand: DemandVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'Demand', Demand);
  }
  DeleteDemand(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'Demand/' + id);
  }


  UpdateInventoryTransfer(InventoryTransfer: InventoryTransferVM) {
    return this.http.put(Globals.BASE_API_URL + 'InventoryTransfer', InventoryTransfer);
  }
  GetInventoryTransferById(id: number): Observable<InventoryTransferVM> {

    return this.http.get<InventoryTransferVM>(Globals.BASE_API_URL + 'InventoryTransfer/' + id).pipe()
  }
  SearchInventoryTransfer(InventoryTransfer: InventoryTransferVM): Observable<InventoryTransferVM[]> {
    return this.http.post<InventoryTransferVM[]>(Globals.BASE_API_URL + 'InventoryTransfer/Search', InventoryTransfer).pipe();
  }
  GetInventoryTransfer(): Observable<InventoryTransferVM[]> {
    return this.http.get<InventoryTransferVM[]>(Globals.BASE_API_URL + 'InventoryTransfer').pipe();
  }
  SaveInventoryTransfer(InventoryTransfer: InventoryTransferVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'InventoryTransfer', InventoryTransfer);
  }
  DeleteInventoryTransfer(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'InventoryTransfer/' + id);
  }


  UpdatePurchaseReturn(PurchaseReturn: PurchaseReturnVM): Observable<PurchaseReturnVM> {
    return this.http.put<PurchaseReturnVM>(Globals.BASE_API_URL + 'PurchaseReturn', PurchaseReturn).pipe();
  }
  GetPurchaseReturnById(id: number): Observable<PurchaseReturnVM> {

    return this.http.get<PurchaseReturnVM>(Globals.BASE_API_URL + 'PurchaseReturn/' + id).pipe()
  }
  SearchPurchaseReturn(PurchaseReturn: PurchaseReturnVM): Observable<PurchaseReturnVM[]> {
    return this.http.post<PurchaseReturnVM[]>(Globals.BASE_API_URL + 'PurchaseReturn/Search', PurchaseReturn).pipe();
  }
  GetPurchaseReturn(): Observable<PurchaseReturnVM[]> {
    return this.http.get<PurchaseReturnVM[]>(Globals.BASE_API_URL + 'PurchaseReturn').pipe();
  }
  SavePurchaseReturn(PurchaseReturn: PurchaseReturnVM): Observable<any> {
    return this.http.post<PurchaseReturnVM>(Globals.BASE_API_URL + 'PurchaseReturn', PurchaseReturn).pipe();
  }
  DeletePurchaseReturn(id: number): Observable<PurchaseReturnVM> {
    return this.http.delete<PurchaseReturnVM>(Globals.BASE_API_URL + 'PurchaseReturn/' + id).pipe();
  }


  UpdateCompleteWaste(CompleteWaste: CompleteWasteVM) {
    return this.http.put(Globals.BASE_API_URL + 'CompleteWaste', CompleteWaste);
  }
  GetCompleteWasteById(id: number): Observable<CompleteWasteVM> {

    return this.http.get<CompleteWasteVM>(Globals.BASE_API_URL + 'CompleteWaste/' + id).pipe()
  }
  SearchCompleteWaste(CompleteWaste: CompleteWasteVM): Observable<CompleteWasteVM[]> {
    return this.http.post<CompleteWasteVM[]>(Globals.BASE_API_URL + 'CompleteWaste/Search', CompleteWaste).pipe();
  }
  GetCompleteWaste(): Observable<CompleteWasteVM[]> {
    return this.http.get<CompleteWasteVM[]>(Globals.BASE_API_URL + 'CompleteWaste').pipe();
  }
  SaveCompleteWaste(CompleteWaste: CompleteWasteVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'CompleteWaste', CompleteWaste);
  }
  DeleteCompleteWaste(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'CompleteWaste/' + id);
  }


  UpdateKitchenDemand(value: KitchenDemandVM) {
    return this.http.put(Globals.BASE_API_URL + 'KitchenDemand', value);
  }
  GetKitchenDemandById(id: number): Observable<KitchenDemandVM> {

    return this.http.get<KitchenDemandVM>(Globals.BASE_API_URL + 'KitchenDemand/' + id).pipe()
  }
  SearchKitchenDemand(value: KitchenDemandVM): Observable<KitchenDemandVM[]> {
    return this.http.post<KitchenDemandVM[]>(Globals.BASE_API_URL + 'KitchenDemand/Search', value).pipe();
  }
  GetKitchenDemand(): Observable<KitchenDemandVM[]> {
    return this.http.get<KitchenDemandVM[]>(Globals.BASE_API_URL + 'KitchenDemand').pipe();
  }
  SaveKitchenDemand(value: KitchenDemandVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'KitchenDemand', value);
  }
  DeleteKitchenDemand(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'KitchenDemand/' + id);
  }


  UpdateStockEstimation(value: StockEstimationVM) {
    return this.http.put(Globals.BASE_API_URL + 'StockEstimation', value);
  }
  GetStockEstimationById(id: number): Observable<StockEstimationVM> {

    return this.http.get<StockEstimationVM>(Globals.BASE_API_URL + 'StockEstimation/' + id).pipe()
  }
  SearchStockEstimation(value: StockEstimationVM): Observable<StockEstimationVM[]> {
    return this.http.post<StockEstimationVM[]>(Globals.BASE_API_URL + 'StockEstimation/Search', value).pipe();
  }
  GetStockEstimation(): Observable<StockEstimationVM[]> {
    return this.http.get<StockEstimationVM[]>(Globals.BASE_API_URL + 'StockEstimation').pipe();
  }
  SaveStockEstimation(value: StockEstimationVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'StockEstimation', value);
  }
  DeleteStockEstimation(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'StockEstimation/' + id);
  }


  UpdateKitchenIssuance(KitchenIssuance: KitchenIssuanceVM) {
    return this.http.put(Globals.BASE_API_URL + 'KitchenIssuance', KitchenIssuance);
  }
  GetKitchenIssuanceById(id: number): Observable<KitchenIssuanceVM> {

    return this.http.get<KitchenIssuanceVM>(Globals.BASE_API_URL + 'KitchenIssuance/' + id).pipe()
  }
  SearchKitchenIssuance(KitchenIssuance: KitchenIssuanceVM): Observable<KitchenIssuanceVM[]> {
    return this.http.post<KitchenIssuanceVM[]>(Globals.BASE_API_URL + 'KitchenIssuance/Search', KitchenIssuance).pipe();
  }
  GetKitchenIssuance(): Observable<KitchenIssuanceVM[]> {
    return this.http.get<KitchenIssuanceVM[]>(Globals.BASE_API_URL + 'KitchenIssuance').pipe();
  }
  SaveKitchenIssuance(KitchenIssuance: KitchenIssuanceVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'KitchenIssuance', KitchenIssuance);
  }
  DeleteKitchenIssuance(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'KitchenIssuance/' + id);
  }

  UpdateIssueStock(IssueStock: IssueStockVM) {
    return this.http.put(Globals.BASE_API_URL + 'IssueStock', IssueStock);
  }
  GetIssueStockById(id: number): Observable<IssueStockVM> {

    return this.http.get<IssueStockVM>(Globals.BASE_API_URL + 'IssueStock/' + id).pipe()
  }
  SearchIssueStock(IssueStock: IssueStockVM): Observable<IssueStockVM[]> {
    return this.http.post<IssueStockVM[]>(Globals.BASE_API_URL + 'IssueStock/Search', IssueStock).pipe();
  }
  GetIssueStock(): Observable<IssueStockVM[]> {
    return this.http.get<IssueStockVM[]>(Globals.BASE_API_URL + 'IssueStock').pipe();
  }
  SaveIssueStock(IssueStock: IssueStockVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'IssueStock', IssueStock);
  }
  DeleteIssueStock(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'IssueStock/' + id);
  }

  UpdatePurchaseOrder(PurchaseOrder: PurchaseOrderVM) {
    return this.http.put(Globals.BASE_API_URL + 'PurchaseOrder', PurchaseOrder);
  }
  GetPurchaseOrderById(id: number): Observable<PurchaseOrderVM> {

    return this.http.get<PurchaseOrderVM>(Globals.BASE_API_URL + 'PurchaseOrder/' + id).pipe()
  }
  SearchPurchaseOrder(PurchaseOrder: PurchaseOrderVM): Observable<PurchaseOrderVM[]> {
    return this.http.post<PurchaseOrderVM[]>(Globals.BASE_API_URL + 'PurchaseOrder/Search', PurchaseOrder).pipe();
  }
  GetPurchaseOrder(): Observable<PurchaseOrderVM[]> {
    return this.http.get<PurchaseOrderVM[]>(Globals.BASE_API_URL + 'PurchaseOrder').pipe();
  }
  SavePurchaseOrder(purchaseorder: PurchaseOrderVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'PurchaseOrder', purchaseorder);
  }
  DeletePurchaseOrder(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'PurchaseOrder/' + id);
  }

  UpdatePurchaseItem(PurchaseItem: PurchaseItemsVM) {
    return this.http.put(Globals.BASE_API_URL + 'PurchaseItems', PurchaseItem);
  }
  GetPurchaseItemById(id: number): Observable<PurchaseItemsVM> {

    return this.http.get<PurchaseItemsVM>(Globals.BASE_API_URL + 'PurchaseItems/' + id).pipe()
  }
  SearchPurchaseItem(PurchaseItem: PurchaseItemsVM): Observable<PurchaseItemsVM[]> {
    return this.http.post<PurchaseItemsVM[]>(Globals.BASE_API_URL + 'PurchaseItems/Search', PurchaseItem).pipe();
  }
  GetPurchaseItem(): Observable<PurchaseItemsVM[]> {
    return this.http.get<PurchaseItemsVM[]>(Globals.BASE_API_URL + 'PurchaseItems').pipe();
  }
  SavePurchaseItem(purchaseitem: PurchaseItemsVM) {
    return this.http.post(Globals.BASE_API_URL + 'PurchaseItems', purchaseitem);
  }
  DeletePurchaseItem(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'PurchaseItems/' + id);
  }

  UpdateRN(RN: RNVM): Observable<RNVM> {
    return this.http.put<RNVM>(Globals.BASE_API_URL + 'RN', RN).pipe();
  }
  GetRNById(id: number): Observable<RNVM> {

    return this.http.get<RNVM>(Globals.BASE_API_URL + 'RN/' + id).pipe()
  }
  SearchRN(RN: RNVM): Observable<RNVM[]> {
    return this.http.post<RNVM[]>(Globals.BASE_API_URL + 'RN/Search', RN).pipe();
  }
  GetRN(): Observable<RNVM[]> {
    return this.http.get<RNVM[]>(Globals.BASE_API_URL + 'RN').pipe();
  }
  SaveRN(RN: RNVM): Observable<any> {
    return this.http.post<RNVM>(Globals.BASE_API_URL + 'RN', RN).pipe();
  }
  DeleteRN(id: number): Observable<RNVM> {
    return this.http.delete<RNVM>(Globals.BASE_API_URL + 'RN/' + id).pipe();
  }


  UpdateRFQ(RFQ: RFQVM): Observable<RFQVM> {
    return this.http.put<RFQVM>(Globals.BASE_API_URL + 'RFQ', RFQ).pipe();
  }
  GetRFQById(id: number): Observable<RFQVM> {

    return this.http.get<RFQVM>(Globals.BASE_API_URL + 'RFQ/' + id).pipe()
  }
  SearchRFQ(RFQ: RFQVM): Observable<RFQVM[]> {
    return this.http.post<RFQVM[]>(Globals.BASE_API_URL + 'RFQ/Search', RFQ).pipe();
  }
  GetRFQ(): Observable<RFQVM[]> {
    return this.http.get<RFQVM[]>(Globals.BASE_API_URL + 'RFQ').pipe();
  }
  SaveRFQ(RFQ: RFQVM): Observable<any> {
    return this.http.post<RFQVM>(Globals.BASE_API_URL + 'RFQ', RFQ).pipe();
  }
  DeleteRFQ(id: number): Observable<RFQVM> {
    return this.http.delete<RFQVM>(Globals.BASE_API_URL + 'RFQ/' + id).pipe();
  }
}
