// route-id.resolver.ts

import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, RouterStateSnapshot } from '@angular/router';

@Injectable({ providedIn: 'root' })
export class RouteIdResolver implements Resolve<number> {
    resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): any {
        debugger
        const routeId = route.queryParams['routeId'];
        return routeId ? +routeId : null;
    }
}
