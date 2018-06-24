#include <iostream>

int main()
{
  int result = EXIT_FAILURE;

  try
  {
    std::cout << "Hello world!\n";

    result = EXIT_SUCCESS;
  }
  catch (const std::exception &e)
  {
    std::cerr << "ERROR: " << e.what() << "\n";
  }
  catch (...)
  {
    std::cerr << "ERROR: Unknown exception caught";
  }

  return result;
}

