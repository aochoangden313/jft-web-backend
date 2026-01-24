import { randomBytes } from 'crypto';

export function generateRefreshToken(): string {
  // Implementation for generating a refresh token
  return randomBytes(32).toString('hex');
}
