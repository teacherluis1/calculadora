import 'dart:math';

double calcularCuotaMensual(double monto, double tasaAnual, int meses) {
  if (meses <= 0 || monto <= 0) {
    return 0.0; // Retorna 0 si los valores son inválidos
  }

  double tasaMensual = tasaAnual / 100 / 12; // Convertir tasa anual a tasa mensual
  if (tasaMensual == 0) {
    return monto / meses; // Si la tasa de interés es 0, la cuota es monto dividido en meses
  }
  return monto *
      tasaMensual *
      (pow(1 + tasaMensual, meses)) /
      (pow(1 + tasaMensual, meses) - 1);
}
