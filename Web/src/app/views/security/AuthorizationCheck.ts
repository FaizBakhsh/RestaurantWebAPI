import { Injectable } from '@angular/core';
import { Router, CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, ActivatedRoute, UrlTree } from '@angular/router';
import { Observable } from 'rxjs';
import { CatalogService } from '../catalog/catalog.service';

@Injectable()
export class AuthorizationCheck implements CanActivate {
   Info: any;
   constructor(private router: Router,
      private catSvc: CatalogService,
      private route: ActivatedRoute,
   ) {
   }
   canActivate(
      routeSnapShot: ActivatedRouteSnapshot,
      state: RouterStateSnapshot,
   ):
      | Observable<boolean | UrlTree>
      | Promise<boolean | UrlTree>
      | boolean
      | UrlTree {
      debugger
      let routeId;
      if (routeSnapShot.queryParams["routeId"] > 0) {
         routeId = [routeSnapShot.queryParams["routeId"], '']
      }
      else
         routeId = routeSnapShot.data["RouteId"] as Array<string>;
      if (routeId != null) {
         var isReadOnly = null;
         for (let routeKeyCode of routeId) {
            if (routeKeyCode != '') {
               let permission = this.catSvc.getPermission(routeKeyCode);
               if (permission != null) //return false;
                  isReadOnly = permission;
            }
         }
         if (isReadOnly == null)
            this.router.navigate(['/unAuth/401']);
      }
      var token = localStorage.getItem('RMSToken');
      if (token) {
         return true;
      }
      else {
         //alert("Please First Sign In to Get Access ")
         this.router.navigate(['/']);
         return true;
      }
   }
}