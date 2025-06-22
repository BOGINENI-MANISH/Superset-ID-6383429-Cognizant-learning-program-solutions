package FinancialForecasting;



public class ForecastRecursiveLog {

    
    public static double futureValue(double principal, double rate, int years) {
        return helper(principal, rate, years, 0);
    }

    private static double helper(double currentValue, double rate, int remainingYears, int year) {
        System.out.printf("Year %d: ₹%.2f\n", year, currentValue);

        
        if (remainingYears == 0) return currentValue;

        //recursively calculate the future value
        return helper(currentValue * (1 + rate), rate, remainingYears - 1, year + 1);
    }

    public static void main(String[] args) {
        double principal = 10000;  // ₹10,000 initial amount
        double rate = 0.10;        // 10% annual growth
        int years = 5;             // Forecast for 5 years

        System.out.println("Tail Recursive Forecasting:\n");
        double finalValue = futureValue(principal, rate, years);
        System.out.printf("\nFinal Value after %d years: ₹%.2f\n", years, finalValue);
    }
}

