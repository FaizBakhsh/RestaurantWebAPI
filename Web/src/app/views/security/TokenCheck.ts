
import { Router, CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, ActivatedRoute } from '@angular/router';
import { CatalogService } from '../catalog/catalog.service';
import { Injectable } from '@angular/core';
@Injectable()
export class TokenCheck implements CanActivate {
    Info: any;
    constructor(private router: Router,
        private catSvc: CatalogService
    ) {

    }

    canActivate(routeSnapShot: ActivatedRouteSnapshot): boolean {
        var token = localStorage.getItem('RMSToken');
        if (token) {
            this.catSvc.CheckandSet()
            return true;
        }
        else {
            let route = routeSnapShot.data["Route"];
            if (route != "secLogin")
                this.router.navigate(['/secLogin']);
            return true;
        }
    }
}