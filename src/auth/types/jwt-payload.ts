// auth/types/jwt-payload.ts
import { Role } from '../enum/role.enum';

export interface JwtPayload {
  sub: string;
  email: string;
  role: Role;
}
